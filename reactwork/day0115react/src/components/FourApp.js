import React from 'react';
import img1 from '../images/K-036.png';
import img2 from '../images/K-039.png';
import img3 from '../images/K-041.png';
import img4 from '../images/K-049.png';
import './MyStyle.css';


function FourApp(props) {
    //4개의 import 된 이미지를 배열에 저장
    const myImage=[img1,img2,img3,img4];
    const data=[
        {"name":"이재영","addr":"시흥","hp":"010-5431-7193","photo":"s1"},
        {"name":"유서연","addr":"성남","hp":"010-4164-6288","photo":"s2"},
        {"name":"김나혜","addr":"서울","hp":"010-8250-0305","photo":"s3"},
        {"name":"김건훈","addr":"서울","hp":"010-2372-8129","photo":"s4"}
    ];

    return (
        <div>
            <h3 className='alert alert-info'>FourApp</h3>
            {
                myImage.map((img,idx)=>(<img alt='' src={img} width='200'/>))
            }
            <hr/>
            {
                data.map((ele,i)=>(
                    <div className='box' key={i}>
                        <h5>이름 : {ele.name}</h5>
                        <h5>주소 : {ele.addr}</h5>
                        <h5>핸드폰 : {ele.hp}</h5>
                        <img alt='프로필사진' 
                        src={require(`../images/${ele.photo}.JPG`)} width='120'/>
                    </div>
                ))
            }
            {
                <table className='table table-bordered' style={{width:'500px'}}>
                    <thead>
                        <th width='50'>번호</th>
                        <th width='100'>사진</th>
                        <th width='100'>이름</th>
                        <th width='150'>핸드폰</th>
                        <th>주소</th>
                    </thead>
                    <tbody>
                       {
                        data.map((ele,idx)=>(
                            <tr key={idx}>
                                <td>{idx+1}</td>
                                <td>
                                    <img alt='' src={require(`../images/${ele.photo}.JPG`)}
                                    width='80'/>
                                </td>
                                <td>{ele.name}</td>
                                <td>{ele.hp}</td>
                                <td>{ele.addr}</td>
                            </tr>
                        ))
                       }
                    </tbody>
                </table>
            }
        </div>
    );
}

export default FourApp;