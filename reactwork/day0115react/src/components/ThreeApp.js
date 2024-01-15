import React from 'react';

function ThreeApp(props) {
    const names=['리액트','스프링부트','자바','파이썬','뷰'];

    //방법1
    //key 값을 unique 한 값으로 태그에 넣어야 콘솔에 오류가 안난다
    const nameList=names.map((irum,i)=>(<li ey={i}>{irum}</li>));

    return (
        <div>
            <h3 className='alert alert-success'>ThreeApp-map 반복문</h3>
            {nameList}
            <hr/>
            {/* 직접 return문 안에서 반복해서 출력하는 경우 */}
            {
                names.map((irum,i)=>(<h6 key={i}>{i}:{irum}</h6>))
            }
            <hr/>
            {/* 배열이 아닌 특정숫자 범위로 출력하고자 할 경우 */}
            {
                //[...new Array(10)].map((a,i)=><h5 key={i}>{i}:{a}</h5>)
                //s1.JPG~s10.JPG 이미지를 map을 이용해서 출력해보자
                [...new Array(8)].map((a,i)=>
                (<img alt='' key={i} src={require(`../images/s${i+1}.JPG`)} width={100}/>))
            }
        </div>
    );
}

export default ThreeApp;