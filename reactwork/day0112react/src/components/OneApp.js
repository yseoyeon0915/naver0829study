//초기 리액트는 컴포넌트가 클래스로 구현되어있다
import React,{Component} from "react";
import './MyStyle.css';
import s1 from '../images/s1.JPG';
import s10 from '../images/s10.JPG';

//class OneApp extends React.Component
class OneApp extends Component
{
    //class에서 변경가능한 state 변수 선언하는 방법
    //ES6에서 생성자 선언하는 방법
    constructor()
    {
        super(); //super 생략시 오류
        this.state={
            number:0
        }
    }
    render(){
        //style 을 변수로 지정한 후 적용하는 방법
        const imgStyle={
            border: '2px solid green',
            width: '130px',
            boxShadow: '3px 3px 3px gray'
        }

        const fontStyle={
            color: 'gray',
            fontFamily: 'Single Day',
            marginTop: '20px'
        }
        const message="Have a Good Day!!";//변경이 필요없는 메세지 변수 선언

        return (
            <div className="box" style={{backgroundColor:'pink'}}>
                <h3 className="alert alert-danger">OneApp
                    <img alt="" src={s1} 
                    style={{width:'60px',float:'right'}}/>
                </h3>
                <img alt="" src={s10} style={imgStyle}/>
                <h2 style={fontStyle}>{message}</h2>

                <div style={{fontSize:'40px',color:'red',marginLeft:'30px'}}>
                    {/*class 일경우 state 변수 출력하는 방법*/}
                    {this.state.number}
                </div>
                <button type="button" className="btn btn-outline-danger"
                onClick={()=>{
                    //number 값 1씩 증가
                    this.setState({
                        number:this.state.number+1
                    })
                }}
                >number증가</button>
            </div>
        )
    }
}

//export default OneApp; //default 는 단 한번만 가능,import 시에 임의로 이름지정
export {OneApp} //여러번 export 가능,import 시에 {OneApp} 으로 import,이름변경안됨