import { Avatar, Rate, Space, Table, Typography, Divider, Tabs } from "antd";
import { useEffect, useState } from "react";
import { getSingleFootData, getFrontData, getPushUpData, getFastRunData, getJumpInplaceData, getSitUpData } from "../../API";

function Orders() {
  const [loading, setLoading] = useState(false);
  const [pushUp, setPushUp] = useState([]);
  const [singleFoot, setSingleFoot] = useState([]);
  const [fastRun, setFastRun] = useState([]);
  const [sitUpData, setSitUp] = useState([]);
  const [jumpInPlace, setJumpInPlace] = useState([]);
  const [frontBody, setFrontBody] = useState([]);

  const programData = [
    ["俯卧撑",pushUp,"俯卧撑成绩(个)","平均速度(个/min)","平均身体高度(cm)"]
    ,["单脚站立",singleFoot,"单脚站立成绩(s)","连续稳定时间(s)","最大抬腿幅度(°)"]
    ,["仰卧起坐",sitUpData,"仰卧起坐成绩(个)","平均速度(个/min)","平均身体角度(°)"]
    ,["原地快跑",fastRun,"原地快跑成绩(个)","最大速度(spm)","平均速度(spm)"]
    ,["原地起跳",jumpInPlace,"原地跳跃成绩(cm)","平均跳跃高度(cm)","身体伸展幅度(°)"]
    ,["立位体前屈",frontBody,"立位体前屈成绩(°)","左腿偏差角度(°)","右腿偏差角度(°)"]
  ];

    const items = programData.map((item, i) => {
    return {
      label: `${item[0]}`,
      key: i,
      children:<><Typography.Title level={4}>{item[0]}</Typography.Title>
      <Table
        loading={loading}
        columns={[
          {
            title: "编号",
            dataIndex: "编号",
          },
          {
            title: "身高(cm)",
            dataIndex: "身高(cm)",
            render: (value) => <span>{value}</span>,
          },
          {
            title: "体重",
            dataIndex: "体重(kg)",
            render: (value) => <span>{value}</span>,
          },
          {
            title: "年龄",
            dataIndex: "年龄",
          },
          {
            title: "性别",
            dataIndex: "性别",
          },
          {
            title:`${item[2]}`,
            dataIndex: `${item[2]}`,
          },{
            title: `${item[3]}`,
            dataIndex: `${item[3]}`,
          },{
            title: `${item[4]}`,
            dataIndex: `${item[4]}`,
          },{
            title: "成绩等级",
            dataIndex: "成绩等级",
          }
        ]}
        dataSource={item[1]}
        pagination={{
          pageSize: 5,
        }}
      ></Table></> 
    };
  });

  useEffect(() => {
    setLoading(true);
    getFrontData().then((res) => {
      setFrontBody(res);
      setLoading(false);
    });
    getPushUpData().then((res) => {
      setPushUp(res);
      setLoading(false);
    });
    getSingleFootData().then((res)=>{
      setSingleFoot(res);
      setLoading(false);
    });
    getFastRunData().then((res)=>{
      setFastRun(res);
      setLoading(false);
    });
    getJumpInplaceData().then((res)=>{
      setJumpInPlace(res);
      setLoading(false);
    })
    getSitUpData().then((res)=>{
      setSitUp(res);
      setLoading(false);
    })
  }, []);

  return (
    <Space size={20} direction="vertical">
      <Tabs items={items} />
    </Space>
    

  );
}
export default Orders;
