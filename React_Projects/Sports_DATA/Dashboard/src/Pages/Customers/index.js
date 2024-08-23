import { Avatar, Rate, Space, Table, Typography } from "antd";
import { useEffect, useState } from "react";
         
import { getPeopleStats } from "../../API"
import { Card, Statistic } from "antd";
import {Col, Row} from "antd";
import { Select } from 'antd';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend,
  PointElement,
  LineElement,
  LineController
} from "chart.js";
import { Bar, Line } from "react-chartjs-2";
import React from 'react';
import Model, { IExerciseData, IMuscleStats } from 'react-body-highlighter';
// import Body from "react-native-body-highlighter";
// import bodyBack from "./assets/bodyBack";

ChartJS.register(
  CategoryScale,
  LinearScale,
  BarElement,
  LineElement,
  LineController,
  Title,
  Tooltip,
  Legend,
  PointElement
);


function Customers() {
  const [loading, setLoading] = useState(false);
  const [dataSource, setDataSource] = useState([]);
  const [peopleIndex, setPeopleIndex] = useState(0);

  const oneData = [];
  const multiData = [];


  const dataCategories = ['编号', '身高(cm)', '体重(kg)', '年龄', '性别', '测试时间(s)', '测试完成度(%)',
  '超过测试人群(%)', '测试等级', '整体肌肉', '上肢肌肉', '大腿肌肉', '小腿肌肉', '背部肌肉', '胸部肌肉',
  '腰腹肌肉', '臀部肌肉', '灵敏性', '平衡感', '协调性', '速度', '爆发力', '反应时', '速度变化(m/s)',
  '加速度变化(m/s2)', '左肩最大活动范围(°)', '右肩最大活动范围(°)', '躯干最大活动范围(°)',
  '左腿最大活动范围(°)', '右腿最大活动范围(°)', '核心耐力等级', '上肢耐力等级', '下肢耐力等级', '重心向前变化',
  '重心向右变化', '左上肢稳定性变化', '右上肢稳定性变化', '左下肢稳定性变化', '右下肢稳定性变化', '左脚冲击力',
  '右脚冲击力', '滞空时间(s)', '简单反应时', '辨别反应时', '选择反应时', '最快反应时间(s)', '最慢反应时间(s)',
  '平均反应时间(s)', '左边关节最大冲击指数', '右边关节最大冲击指数', '左边关节平均冲击指数', '右边关节平均冲击指数',
  '左边关节损伤风险系数', '右边关节损伤风险系数', '总卡路里消耗(cal)', '右腿消耗(%)', '右臂消耗(%)',
  '左腿消耗(%)', '左臂消耗(%)', '胸部消耗(%)', '腰腹消耗(%)'];


//   const personwiseData = dataSource ? dataSource.map((item, i) => 
//   {  
//     return {labels: new Array(item[dataCategories[0]].length).fill('').map((val, i) => i),
//     datasets: [{
//       label: 'Mask',
//       data: item[dataCategories[i]],
//       fill: false,
//       borderColor: 'rgb(75, 192, 192)',
//       tension: 0.1
//     }]
//   }
// }):[];

//   const personData =  dataSource ? dataCategories.map((item, i) => 
//   {  
//     return {labels: new Array(item[dataCategories[0]].length).fill('').map((val, i) => i),
//     datasets: [{
//       label: 'Mask',
//       data: item[dataCategories[i]],
//       fill: false,
//       borderColor: 'rgb(75, 192, 192)',
//       tension: 0.1
//     }]
//   }
// }):[];

  const data_row1 = [{
    labels: dataSource[peopleIndex] ? new Array(dataSource[peopleIndex]["加速度变化(m/s2)"].length).fill('').map((val, i) => i):[],
    datasets: [{
      label: 'Value',
      data: dataSource[peopleIndex]?dataSource[peopleIndex]["加速度变化(m/s2)"]:[],
      fill: false,
      borderColor: 'rgb(75, 192, 192)',
      tension: 0.1
    }]
  },
  {
    labels: dataSource[peopleIndex] ? new Array(dataSource[peopleIndex]["速度变化(m/s)"].length).fill('').map((val, i) => i):[],
    datasets: [{
      label: 'Value',
      data: dataSource[peopleIndex]?dataSource[peopleIndex]["速度变化(m/s)"]:[],
      fill: false,
      borderColor: 'rgb(75, 192, 192)',
      tension: 0.1
    }]
  },
];


const data_row2 = [
  {
    labels: dataSource[peopleIndex]?new Array(dataSource[peopleIndex]["重心向右变化"].length).fill('').map((val, i) => i):[],
    datasets: [{
      label: 'Value',
      data: dataSource[peopleIndex]?dataSource[peopleIndex]["重心向右变化"]:[],
      fill: false,
      borderColor: 'rgb(75, 192, 192)',
      tension: 0.1
    }]
  },
  {
    labels: dataSource[peopleIndex]?new Array(dataSource[peopleIndex]["重心向前变化"].length).fill('').map((val, i) => i):[],
    datasets: [{
      label: 'Value',
      data: dataSource[peopleIndex]?dataSource[peopleIndex]["重心向前变化"]:[],
      fill: false,
      borderColor: 'rgb(75, 192, 192)',
      tension: 0.1
    }]
  },
]

const data_row3 = [
  {
    labels: dataSource[peopleIndex]?new Array(dataSource[peopleIndex]["左上肢稳定性变化"].length).fill('').map((val, i) => i):[],
    datasets: [{
      label: 'Value',
      data: dataSource[peopleIndex]?dataSource[peopleIndex]["左上肢稳定性变化"]:[],
      fill: false,
      borderColor: 'rgb(75, 192, 192)',
      tension: 0.1
    }]
  },
  {
    labels: dataSource[peopleIndex]?new Array(dataSource[peopleIndex]["右上肢稳定性变化"].length).fill('').map((val, i) => i):[],
    datasets: [{
      label: 'Value',
      data: dataSource[peopleIndex]?dataSource[peopleIndex]["右上肢稳定性变化"]:[],
      fill: false,
      borderColor: 'rgb(75, 192, 192)',
      tension: 0.1
    }]
  },
]

const data_row4 = [
  {
    labels: dataSource[peopleIndex]?new Array(dataSource[peopleIndex]["左下肢稳定性变化"].length).fill('').map((val, i) => i):[],
    datasets: [{
      label: 'Value',
      data: dataSource[peopleIndex]?dataSource[peopleIndex]["左下肢稳定性变化"]:[],
      fill: false,
      borderColor: 'rgb(75, 192, 192)',
      tension: 0.1
    }]
  },
  {
    labels: dataSource[peopleIndex]?new Array(dataSource[peopleIndex]["左下肢稳定性变化"].length).fill('').map((val, i) => i):[],
    datasets: [{
      label: 'Value',
      data: dataSource[peopleIndex]?dataSource[peopleIndex]["左下肢稳定性变化"]:[],
      fill: false,
      borderColor: 'rgb(75, 192, 192)',
      tension: 0.1
    }]
  },
]

  const tradeColumns_row1 = ["加速度变化(m/s2)","速度变化(m/s)"];
  const tradeColumns_row2 = ["重心向右变化","重心向前变化"];
  const tradeColumns_row3 = ["左上肢稳定性变化","右上肢稳定性变化"];
  const tradeColumns_row4 = ["左下肢稳定性变化","右下肢稳定性变化"];

// const tradeColumns = ["左边关节最大冲击指数","右边关节最大冲击指数","左边关节平均冲击指数"
// ,"右边关节平均冲击指数","左边关节损伤风险系数","右边关节损伤风险系数"
// ,"速度变化(m/s)","加速度变化(m/s2)","重心向右变化"
// ,"左上肢稳定性变化","右上肢稳定性变化","左下肢稳定性变化",
// "右下肢稳定性变化","重心向前变化"];

  const options_row1 = tradeColumns_row1.map((item, i)=>{return {
    responsive: true,
    plugins: {
      legend: {
        position: "bottom",
      },
      title: {
        display: true,
        text: item,
      },
    },
  }})

  const options_row2 = tradeColumns_row2.map((item, i)=>{return {
    responsive: true,
    plugins: {
      legend: {
        position: "bottom",
      },
      title: {
        display: true,
        text: item,
      },
    },
  }})

  const options_row3 = tradeColumns_row3.map((item, i)=>{return {
    responsive: true,
    plugins: {
      legend: {
        position: "bottom",
      },
      title: {
        display: true,
        text: item,
      },
    },
  }})

  const options_row4 = tradeColumns_row4.map((item, i)=>{return {
    responsive: true,
    plugins: {
      legend: {
        position: "bottom",
      },
      title: {
        display: true,
        text: item,
      },
    },
  }})

  const lineCharts_row1 = dataSource ? 
  ( data_row1.map((item, i) => 
  <Col span={12}>
    <Card style={{ width: 500, height: 250 }}>
      <Line options={options_row1[i]} data={item} />
    </Card>
  </Col>))
  :null;

  const lineCharts_row2 = dataSource ? 
  ( data_row2.map((item, i) => 
  <Col span={12}>
    <Card style={{ width: 500, height: 250 }}>
      <Line options={options_row2[i]} data={item} />
    </Card>
  </Col>))
  :null;


  const lineCharts_row3 = dataSource ? 
  ( data_row3.map((item, i) => 
  <Col span={12}>
    <Card style={{ width: 500, height: 250 }}>
      <Line options={options_row3[i]} data={item} />
    </Card>
  </Col>))
  :null;

  const lineCharts_row4 = dataSource ? 
  ( data_row4.map((item, i) => 
  <Col span={12}>
    <Card style={{ width: 500, height: 250 }}>
      <Line options={options_row4[i]} data={item} />
    </Card>
  </Col>))
  :null;

  useEffect(() => {
    setLoading(true);
    getPeopleStats().then(res => {
      setDataSource(res);
      setLoading(false);
    });
  }, []);

  const FrontData = [
    { name:"Shit", muscles: ['biceps'], frequency:1 },
    { name: 'Push Ups', muscles: ['chest'],  frequency:2 },
    { name: 'Push Ups', muscles: ['abs'],  frequency:2 },
    { name: 'Push Ups', muscles: ['calves'],  frequency:1 },
    { name: 'Push Ups', muscles: ['obliques'],  frequency:1 },
  ];

  const BackData = [
    { name: 'Bench Press', muscles: ['trapezius'], frequency:1 }
  ];


  // 测试等级数据
  const gradeData = [
    {"编号":1,"身高(cm)":180,"体重(kg)":75,"年龄":15,"性别":"男","测试等级":"B","整体肌肉":"D","上肢肌肉":"D","大腿肌肉":"D","小腿肌肉":"S","背部肌肉":"D","胸部肌肉":"D","腰腹肌肉":"D","臀部肌肉":"B","灵敏性":"一般","平衡感":"优秀","协调性":"优秀","速度":"优秀","爆发力":"优秀","反应时":"优秀"},
    {"编号":2,"身高(cm)":177,"体重(kg)":65,"年龄":16,"性别":"男","测试等级":"B","整体肌肉":"C","上肢肌肉":"C","大腿肌肉":"B","小腿肌肉":"S","背部肌肉":"D","胸部肌肉":"C","腰腹肌肉":"C","臀部肌肉":"A","灵敏性":"良好","平衡感":"一般","协调性":"良好","速度":"优秀","爆发力":"优秀","反应时":"优秀"},
    {"编号":3,"身高(cm)":175,"体重(kg)":62,"年龄":15,"性别":"男","测试等级":"B","整体肌肉":"C","上肢肌肉":"C","大腿肌肉":"C","小腿肌肉":"S","背部肌肉":"D","胸部肌肉":"C","腰腹肌肉":"C","臀部肌肉":"B","灵敏性":"一般","平衡感":"优秀","协调性":"优秀","速度":"优秀","爆发力":"优秀","反应时":"优秀"},
    {"编号":4,"身高(cm)":160,"体重(kg)":50,"年龄":13,"性别":"女","测试等级":"C","整体肌肉":"C","上肢肌肉":"C","大腿肌肉":"C","小腿肌肉":"B","背部肌肉":"E","胸部肌肉":"C","腰腹肌肉":"C","臀部肌肉":"B","灵敏性":"中等","平衡感":"优秀","协调性":"良好","速度":"一般","爆发力":"良好","反应时":"良好"},
    {"编号":5,"身高(cm)":165,"体重(kg)":52,"年龄":14,"性别":"男","测试等级":"C","整体肌肉":"D","上肢肌肉":"D","大腿肌肉":"C","小腿肌肉":"C","背部肌肉":"D","胸部肌肉":"D","腰腹肌肉":"C","臀部肌肉":"B","灵敏性":"中等","平衡感":"良好","协调性":"良好","速度":"中等","爆发力":"优秀","反应时":"优秀"},
    {"编号":6,"身高(cm)":171,"体重(kg)":55,"年龄":13,"性别":"女","测试等级":"B","整体肌肉":"B","上肢肌肉":"B","大腿肌肉":"A","小腿肌肉":"S","背部肌肉":"E","胸部肌肉":"B","腰腹肌肉":"B","臀部肌肉":"A","灵敏性":"良好","平衡感":"中等","协调性":"一般","速度":"优秀","爆发力":"优秀","反应时":"优秀"},
    {"编号":7,"身高(cm)":165,"体重(kg)":59,"年龄":12,"性别":"女","测试等级":"B","整体肌肉":"B","上肢肌肉":"B","大腿肌肉":"A","小腿肌肉":"B","背部肌肉":"D","胸部肌肉":"B","腰腹肌肉":"B","臀部肌肉":"A","灵敏性":"一般","平衡感":"较差","协调性":"一般","速度":"一般","爆发力":"优秀","反应时":"优秀"},
    {"编号":8,"身高(cm)":158,"体重(kg)":41,"年龄":11,"性别":"女","测试等级":"B","整体肌肉":"B","上肢肌肉":"B","大腿肌肉":"A","小腿肌肉":"S","背部肌肉":"E","胸部肌肉":"B","腰腹肌肉":"A","臀部肌肉":"A","灵敏性":"良好","平衡感":"优秀","协调性":"良好","速度":"优秀","爆发力":"优秀","反应时":"良好"},
    {"编号":9,"身高(cm)":160,"体重(kg)":40,"年龄":12,"性别":"男","测试等级":"C","整体肌肉":"C","上肢肌肉":"C","大腿肌肉":"A","小腿肌肉":"S","背部肌肉":"D","胸部肌肉":"C","腰腹肌肉":"C","臀部肌肉":"A","灵敏性":"良好","平衡感":"较差","协调性":"中等","速度":"优秀","爆发力":"良好","反应时":"良好"},
    {"编号":10,"身高(cm)":160,"体重(kg)":50,"年龄":13,"性别":"男","测试等级":"B","整体肌肉":"C","上肢肌肉":"C","大腿肌肉":"B","小腿肌肉":"A","背部肌肉":"D","胸部肌肉":"C","腰腹肌肉":"B","臀部肌肉":"A","灵敏性":"一般","平衡感":"中等","协调性":"一般","速度":"良好","爆发力":"优秀","反应时":"良好"},
    {"编号":11,"身高(cm)":146,"体重(kg)":33,"年龄":10,"性别":"男","测试等级":"B","整体肌肉":"C","上肢肌肉":"D","大腿肌肉":"B","小腿肌肉":"A","背部肌肉":"C","胸部肌肉":"D","腰腹肌肉":"C","臀部肌肉":"B","灵敏性":"一般","平衡感":"优秀","协调性":"良好","速度":"良好","爆发力":"良好","反应时":"一般"},
    {"编号":12,"身高(cm)":168,"体重(kg)":44,"年龄":11,"性别":"女","测试等级":"B","整体肌肉":"C","上肢肌肉":"E","大腿肌肉":"A","小腿肌肉":"S","背部肌肉":"C","胸部肌肉":"E","腰腹肌肉":"B","臀部肌肉":"A","灵敏性":"良好","平衡感":"中等","协调性":"一般","速度":"优秀","爆发力":"优秀","反应时":"优秀"},
    {"编号":13,"身高(cm)":146,"体重(kg)":34,"年龄":10,"性别":"女","测试等级":"B","整体肌肉":"B","上肢肌肉":"C","大腿肌肉":"S","小腿肌肉":"S","背部肌肉":"D","胸部肌肉":"C","腰腹肌肉":"C","臀部肌肉":"S","灵敏性":"优秀","平衡感":"优秀","协调性":"良好","速度":"优秀","爆发力":"优秀","反应时":"良好"},
    {"编号":14,"身高(cm)":145,"体重(kg)":65,"年龄":10,"性别":"男","测试等级":"B","整体肌肉":"C","上肢肌肉":"D","大腿肌肉":"A","小腿肌肉":"S","背部肌肉":"D","胸部肌肉":"D","腰腹肌肉":"B","臀部肌肉":"A","灵敏性":"良好","平衡感":"中等","协调性":"一般","速度":"优秀","爆发力":"优秀","反应时":"优秀"},
    {"编号":15,"身高(cm)":142,"体重(kg)":37,"年龄":10,"性别":"男","测试等级":"C","整体肌肉":"C","上肢肌肉":"D","大腿肌肉":"B","小腿肌肉":"S","背部肌肉":"C","胸部肌肉":"D","腰腹肌肉":"B","臀部肌肉":"B","灵敏性":"良好","平衡感":"较差","协调性":"中等","速度":"优秀","爆发力":"良好","反应时":"一般"}
  ];

  // 活动消耗数据
  const consumeData = [
    {"编号":1,"身高(cm)":180,"体重(kg)":75,"年龄":15,"性别":"男","总卡路里消耗(cal)":164.4,"右腿消耗(%)":20,"右臂消耗(%)":10,"左腿消耗(%)":20,"左臂消耗(%)":10,"胸部消耗(%)":20,"腰腹消耗(%)":20},
    {"编号":2,"身高(cm)":177,"体重(kg)":65,"年龄":16,"性别":"男","总卡路里消耗(cal)":201.8,"右腿消耗(%)":18,"右臂消耗(%)":11,"左腿消耗(%)":18,"左臂消耗(%)":11,"胸部消耗(%)":21,"腰腹消耗(%)":21},
    {"编号":3,"身高(cm)":175,"体重(kg)":62,"年龄":15,"性别":"男","总卡路里消耗(cal)":174.3,"右腿消耗(%)":17,"右臂消耗(%)":11,"左腿消耗(%)":17,"左臂消耗(%)":11,"胸部消耗(%)":22,"腰腹消耗(%)":22},
    {"编号":4,"身高(cm)":160,"体重(kg)":50,"年龄":13,"性别":"女","总卡路里消耗(cal)":93.7,"右腿消耗(%)":14,"右臂消耗(%)":12,"左腿消耗(%)":14,"左臂消耗(%)":12,"胸部消耗(%)":24,"腰腹消耗(%)":24},
    {"编号":5,"身高(cm)":165,"体重(kg)":52,"年龄":14,"性别":"男","总卡路里消耗(cal)":118.7,"右腿消耗(%)":15,"右臂消耗(%)":10,"左腿消耗(%)":15,"左臂消耗(%)":10,"胸部消耗(%)":20,"腰腹消耗(%)":30},
    {"编号":6,"身高(cm)":171,"体重(kg)":55,"年龄":13,"性别":"女","总卡路里消耗(cal)":162,"右腿消耗(%)":16,"右臂消耗(%)":11,"左腿消耗(%)":16,"左臂消耗(%)":11,"胸部消耗(%)":23,"腰腹消耗(%)":23},
    {"编号":7,"身高(cm)":165,"体重(kg)":59,"年龄":12,"性别":"女","总卡路里消耗(cal)":123.8,"右腿消耗(%)":14,"右臂消耗(%)":12,"左腿消耗(%)":14,"左臂消耗(%)":12,"胸部消耗(%)":24,"腰腹消耗(%)":24},
    {"编号":8,"身高(cm)":158,"体重(kg)":41,"年龄":11,"性别":"女","总卡路里消耗(cal)":157.6,"右腿消耗(%)":15,"右臂消耗(%)":11,"左腿消耗(%)":15,"左臂消耗(%)":11,"胸部消耗(%)":22,"腰腹消耗(%)":26},
    {"编号":9,"身高(cm)":160,"体重(kg)":40,"年龄":12,"性别":"男","总卡路里消耗(cal)":112.5,"右腿消耗(%)":19,"右臂消耗(%)":10,"左腿消耗(%)":19,"左臂消耗(%)":10,"胸部消耗(%)":21,"腰腹消耗(%)":21},
    {"编号":10,"身高(cm)":160,"体重(kg)":50,"年龄":13,"性别":"男","总卡路里消耗(cal)":144,"右腿消耗(%)":16,"右臂消耗(%)":10,"左腿消耗(%)":16,"左臂消耗(%)":10,"胸部消耗(%)":21,"腰腹消耗(%)":27},
    {"编号":11,"身高(cm)":146,"体重(kg)":33,"年龄":10,"性别":"男","总卡路里消耗(cal)":94.1,"右腿消耗(%)":20,"右臂消耗(%)":9,"左腿消耗(%)":20,"左臂消耗(%)":9,"胸部消耗(%)":17,"腰腹消耗(%)":25},
    {"编号":12,"身高(cm)":168,"体重(kg)":44,"年龄":11,"性别":"女","总卡路里消耗(cal)":119.5,"右腿消耗(%)":24,"右臂消耗(%)":4,"左腿消耗(%)":24,"左臂消耗(%)":4,"胸部消耗(%)":9,"腰腹消耗(%)":35},
    {"编号":13,"身高(cm)":146,"体重(kg)":34,"年龄":10,"性别":"女","总卡路里消耗(cal)":106.8,"右腿消耗(%)":20,"右臂消耗(%)":10,"左腿消耗(%)":20,"左臂消耗(%)":10,"胸部消耗(%)":20,"腰腹消耗(%)":20},
    {"编号":14,"身高(cm)":145,"体重(kg)":65,"年龄":10,"性别":"男","总卡路里消耗(cal)":171.1,"右腿消耗(%)":20,"右臂消耗(%)":7,"左腿消耗(%)":20,"左臂消耗(%)":7,"胸部消耗(%)":15,"腰腹消耗(%)":31},
    {"编号":15,"身高(cm)":142,"体重(kg)":37,"年龄":10,"性别":"男","总卡路里消耗(cal)":122.2,"右腿消耗(%)":19,"右臂消耗(%)":8,"左腿消耗(%)":19,"左臂消耗(%)":8,"胸部消耗(%)":15,"腰腹消耗(%)":31}
    ]

  const onChange = (value)=>{
    console.log("triggered");
    setPeopleIndex(value);
  }

  const onSearch = (value) => {
    console.log("triggered");
  }

  return (
    <Space size={20} direction="vertical">
    <Typography.Text>成员编号 {peopleIndex + 1}</Typography.Text>
    <Select
      showSearch
      placeholder="1"
      optionFilterProp="children"
      onChange={onChange}
      onSearch={onSearch}
      filterOption={(input, option) =>
        (option?.label ?? '').toLowerCase().includes(input.toLowerCase())
      }
      options={[
        {
          value: 0,
          label: "1",
        },
        {
          value: 1,
          label: "2",
        },
        {
          value: 2,
          label: "3",
        },
        {
          value: 3,
          label: "4",
        },
        {
          value: 4,
          label: "5",
        },
        {
          value: 5,
          label: "6",
        },
        {
          value: 6,
          label: "7",
        },
        {
          value: 7,
          label: "8",
        },
        {
          value: 8,
          label: "9",
        },
        {
          value: 9,
          label: "10",
        },
        {
          value: 10,
          label: "11",
        },
        {
          value:11,
          label: "12",
        },
        {
          value:12,
          label: "13",
        },
        {
          value:13,
          label: "14",
        },
        {
          value:14,
          label: "15",
        },
      ]}
  />
    <Row gutter={24}>
    {lineCharts_row1}
    </Row>
    <Row gutter={24}>
    {lineCharts_row2}
    </Row>
    <Row gutter={24}>
    {lineCharts_row3}
    </Row>
    <Row gutter={24}>
    {lineCharts_row4}
    </Row>
      <Typography.Text>各项等级</Typography.Text>
      <Table
        columns={[
          {
            title: "测试等级",
            dataIndex: "测试等级",
          },
          {
            title: "整体肌肉",
            dataIndex: "整体肌肉",
          },
          {
            title: "上肢肌肉",
            dataIndex: "上肢肌肉",
          },
          {
            title: "大腿肌肉",
            dataIndex: "大腿肌肉",
          },
          {
            title: "小腿肌肉",
            dataIndex: "小腿肌肉",
          },
          {
            title: "胸部肌肉",
            dataIndex: "胸部肌肉",
          },
          {
            title: "腰腹肌肉",
            dataIndex: "腰腹肌肉",
          },
          {
            title: "臀部肌肉",
            dataIndex: "臀部肌肉",
          },
          {
            title: "灵敏性",
            dataIndex: "灵敏性",
          },
          {
            title: "平衡感",
            dataIndex: "平衡感",
          },
          {
            title: "协调性",
            dataIndex: "协调性",
          },
          {
            title: "速度",
            dataIndex: "速度",
          },
          {
            title: "爆发力",
            dataIndex: "爆发力",
          },
          {
            title: "反应时",
            dataIndex: "反应时",
          },
        ]}
        loading={loading}
        dataSource={gradeData.splice(peopleIndex, 1)}
        pagination={false}
      ></Table>
      <Typography.Text>活动消耗</Typography.Text>
      <Row>
      <Col span={12}>   
      <Model
          data={FrontData}
          style={{ width: '20rem', padding: '5rem' }}
          highlightedColors={["#89340a97","#89340aca","#e35209a8ca","#e352097eca","#e3520998ca"]}
          type="anterior"
        /></Col>
      <Col span={12}> 
      <Model
          data={BackData}
          style={{ width: '20rem', padding: '5rem' }}
          highlightedColors={["#89340a97"]}
          type="posterior"
        /></Col>
    </Row>
    </Space>
  );
}
function DashboardCard({ title, value, icon }) {
  return (
    <Card>
      <Space direction="horizontal">
        {icon}
        <Statistic title={title} value={value} />
      </Space>
    </Card>
  );
}


export default Customers;
