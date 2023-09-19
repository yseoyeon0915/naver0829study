package bit701.day0919;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class Ex4_ClientChat extends JFrame implements Runnable,ActionListener{
	String nickName;
	JTextArea area;
	JTextField tfNickName,tfMessage,tfServerIp;
	JButton btnSend,btnConnect;
	Socket clientSocket;
	
	BufferedReader br;
	PrintWriter pw;
	
	public Ex4_ClientChat() {
		// TODO Auto-generated constructor stub
		this.setBounds(1000, 100, 400, 400);
		this.setDesign();
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setVisible(true);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		Object ob=e.getSource();
		//메세지 입력후 엔터를 누르거나 전송 버튼을 누를경우 같은 코드가 실행된다
		if(ob==tfMessage || ob==btnSend)
		{
			System.out.println("메세지 보냄");
			//서버에 "2|메세지" 이런식으로 보낸다
			pw.println("2|"+tfMessage.getText()+"\n");
			pw.flush();//네트워크로 실제 전송
			
			//입력한 문자열 지우기
			tfMessage.setText("");
			tfMessage.requestFocus();//포커스 주기
		}		
	}
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		//System.out.println("호출");
		
		//서버에 접속
		try {
			clientSocket=new Socket(tfServerIp.getText(), 6000);
			
			//대화를 주고받을수 있게 io 클래스 얻기
			InputStream is=null;
			try {
				is=clientSocket.getInputStream();
				br=new BufferedReader(new InputStreamReader(is));
				pw=new PrintWriter(clientSocket.getOutputStream());	
				area.append("서버에 접속 성공!!\n");
				
				//서버에 "1|닉네임" 이런식으로 보낸다
				pw.println("1|"+nickName+"\n");
				pw.flush();
				
				//서버가 언제 메세지를 보낼지 모르므로 while문을 열어두고 
				//메세지가 올때마다 실시간으로 출력한다
				while(true)
				{
					String message=br.readLine();
					area.append(message+"\n");
					this.autoScroll();
				}
			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
			}			
			
		} catch (IOException e) {
			area.append("서버에 접속 실패:"+e.getMessage()+"\n");
		}
		
	}

	private void setDesign() {
		// TODO Auto-generated method stub
		JPanel pTop=new JPanel();
		tfNickName=new JTextField("이문희",5);//자기이름으로 초기값
		tfServerIp=new JTextField("192.168.0.29");//각자 자기 ip를 초기값으로
		
		btnConnect=new JButton("서버접속");
		pTop.add(new JLabel("닉네임:"));
		pTop.add(tfNickName);
		pTop.add(tfServerIp);
		pTop.add(btnConnect);
		this.add("North",pTop);
		
		JPanel pBottom=new JPanel();
		tfMessage=new JTextField(25);
		btnSend=new JButton("전송");
		pBottom.add(tfMessage);
		pBottom.add(btnSend);
		this.add("South",pBottom);
		
		area=new JTextArea();
		this.add("Center",new JScrollPane(area));
		
		//접속 버튼
		btnConnect.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				//닉네임을 읽어서 창제목으로 넣기
				nickName=tfNickName.getText();
				//창제목으로 넣기
				Ex4_ClientChat.this.setTitle(nickName+"님 채팅창");
				
				//run 메소드 호출
				Thread th=new Thread(Ex4_ClientChat.this);
				th.start();//run 메소드 호출
			}
		});
		
		//메세지 입력후 엔터 또는 전송 버튼 누를때 이벤트 발생
		//둘다 같은 메서드 호출-기능이 같으므로
		tfMessage.addActionListener(this);
		btnSend.addActionListener(this);		
	}

	public void autoScroll()
	{
		int n=area.getDocument().getLength();//총 라인수
		area.setCaretPosition(n);//마지막줄로 위치 변경
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Ex4_ClientChat client=new Ex4_ClientChat();

	}

}