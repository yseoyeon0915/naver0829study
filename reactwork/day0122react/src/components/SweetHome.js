import React, { useCallback, useState } from 'react';
import Light from './Light';

const SweetHome = () => {
    const [masterOn,setMasterOn]=useState(false);
    const [kitchenOn,setKitchenOn]=useState(false);
    const [bathOn,setBathOn]=useState(false);

    //각 room의 불을 켜고 꺼는 이벤트들
    // const toggleMaster=()=>{
    //     setMasterOn(!masterOn);
    // }

    // const toggleKitchen=()=>{
    //     setKitchenOn(!kitchenOn);
    // }

    // const toggleBath=()=>{
    //     setBathOn(!bathOn);
    // }

    //useCallback 을 적용하면 해당 변수가 바뀔경우에만 렌더링이 일어난다
    const toggleMaster=useCallback(()=>{
        setMasterOn(!masterOn);
    },[masterOn]);

    const toggleKitchen=useCallback(()=>{
        setKitchenOn(!kitchenOn);
    }, [kitchenOn]);

    const toggleBath=useCallback(()=>{
        setBathOn(!bathOn);
    }, [bathOn]);

    return (
        <div>
            <Light room={'침실'} on={masterOn} toggle={toggleMaster}/>
            <Light room={'주방'} on={kitchenOn} toggle={toggleKitchen}/>
            <Light room={'욕실'} on={bathOn} toggle={toggleBath}/>
        </div>
    );
};

export default SweetHome;