import React from 'react';
import { useNavigate } from 'react-router-dom';

const PersonRowItem = (props) => {
    const {idx,row,onDelete}=props;

    const navi=useNavigate();

    return (
        <tr>
            <td align='center'>{idx+1}</td>
            <td>
                <div style={{cursor:'pointer'}}
                 onClick={()=>navi(`/detail/${row.pnum}`)}>
                    {
                        row.photo
                        &&
                        <img alt=''
                        src={require(`../images/${row.photo}`)}
                        style={{width:'30px',height:'30px',border:'1px solid gray'}}/>
                    }

                    <b style={{marginLeft:'10px'}}>{row.name}</b>
                </div>
            </td>
            <td align='center'>
                <button className='btn btn-danger btn-sm'
                onClick={()=>onDelete(row.pnum)}>
                    회원삭제
                </button>
            </td>
        </tr>
    );
};

export default PersonRowItem;