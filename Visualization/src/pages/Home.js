/*!
  =========================================================
  * Muse Ant Design Dashboard - v1.0.0
  =========================================================
  * Product Page: https://www.creative-tim.com/product/muse-ant-design-dashboard
  * Copyright 2021 Creative Tim (https://www.creative-tim.com)
  * Licensed under MIT (https://github.com/creativetimofficial/muse-ant-design-dashboard/blob/main/LICENSE.md)
  * Coded by Creative Tim
  =========================================================
  * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
*/
import { useState,useEffect } from "react";

import {
  Card,
  Col,
  Row,
  Typography,
  Tooltip,
  Progress,
  Upload,
  message,
  Button,
  Timeline,
  Radio,
  Space, Statistic, Table
} from "antd";

import { getPeopleStats } from "../API";
import { Pie, measureTextWidth, Column } from '@ant-design/plots';

import {
  ToTopOutlined,
  MenuUnfoldOutlined,
  RightOutlined,
} from "@ant-design/icons";
import Paragraph from "antd/lib/typography/Paragraph";

import Echart from "../components/chart/EChart";
import LineChart from "../components/chart/LineChart";


function Home() {
  const { Title, Text } = Typography;

  const onChange = (e) => console.log(`radio checked:${e.target.value}`);

  const [reverse, setReverse] = useState(false);

  const [data, setDataSource] = useState([]);

  useEffect(() => {
    getPeopleStats().then(res => {

      const res_data = res.map(item => {
        return {
            ...item,
            "原地跳跃成绩等级": item["成绩等级"],
            "俯卧撑成绩等级": item["成绩等级.1"],
            "仰卧起坐成绩等级": item["成绩等级.2"],
            "单脚站立成绩等级": item["成绩等级.3"],
            "原地快跑成绩等级": item["成绩等级.4"],
            "立位体前屈成绩等级": item["成绩等级.5"],
            "高抬腿成绩等级": item["成绩等级.6"],
            "反应测试成绩等级": item["成绩等级.7"],
            "俯卧撑平均速度":item["平均速度(个/min)"],
            "仰卧起坐平均速度": item["平均速度(个/min).1"]
        }
       });
      setDataSource(res_data);
    });
  }, []);


  const columnFields = ["测试等级",
                        "俯卧撑成绩等级",
                        "原地快跑成绩等级",
                        "高抬腿成绩等级",
                        "仰卧起坐成绩等级",
                        "单脚站立成绩等级",
                        "立位体前屈成绩等级",
                        "反应测试成绩等级"
                        ]

  const stats = columnFields.map((item, index)=>{
    return [
      {
        type: 'S',
        value: 0,
      },
      {
        type: 'A',
        value: 0,
      },
      {
        type: 'B',
        value: 0,
      },
      {
        type: 'C',
        value: 0,
      },
      {
        type: 'D',
        value: 0,
      },
      {
        type: 'E',
        value: 0,
      },
    ]
  })

  // console.log(stats);
  columnFields.forEach((program, programIndex)=>{
    data.forEach((item,index)=>{
      switch(item[program]) {
        case "S":
          stats[programIndex][0]["value"]++;
          break;
        case "A":
          // console.log("A")
          stats[programIndex][1]["value"] ++;
          break;
        case "B":
          // console.log("B")
          stats[programIndex][2]["value"] ++;
          break;
        case "C":
          // console.log("C")
          stats[programIndex][3]["value"] ++;
          break;
        case "D":
          stats[programIndex][4]["value"] ++;
          break;
        case "E":
          stats[programIndex][5]["value"] ++;
          break;
      }
    })
  })

  // console.log(stats);

  // Data Sector
  // 1. 测试总体成绩
  // const final = [
  //   {
  //     type: 'S',
  //     value: 0,
  //   },
  //   {
  //     type: 'A',
  //     value: 0,
  //   },
  //   {
  //     type: 'B',
  //     value: 0,
  //   },
  //   {
  //     type: 'C',
  //     value: 0,
  //   },
  //   {
  //     type: 'D',
  //     value: 0,
  //   },
  //   {
  //     type: 'E',
  //     value: 0,
  //   },
  // ]


  // // 2. 俯卧撑
  // const pushup = [
  //   {
  //     type: "S",
  //     value: 0
  //   },
  //   {
  //     type: 'A',
  //     value: 10,
  //   },
  //   {
  //     type: 'B',
  //     value: 19,
  //   },
  //   {
  //     type: 'C',
  //     value: 45,
  //   },
  //   {
  //     type: 'D',
  //     value: 29,
  //   },
  //   {
  //     type: 'E',
  //     value: 14,
  //   },
  // ];

  // // 3. 原地快跑成绩
  // const fastrun = [
  //   {
  //     type: 'A',
  //     value: 10,
  //   },
  //   {
  //     type: 'B',
  //     value: 3,
  //   },
  //   {
  //     type: 'C',
  //     value: 4,
  //   },
  //   {
  //     type: 'D',
  //     value: 2,
  //   },
  //   {
  //     type: 'E',
  //     value: 1,
  //   },
  // ];

  return (
    <>
      <Row gutter={[10, 12]}>

          <Col xs={24} sm={15} md={10} lg={10} xl={12} className="mb-24">
            <Card title="测试总体等级" bordered={false} >
              <DemoPie data={stats[0]}/>
            </Card>
          </Col>

          <Col xs={24} sm={15} md={10} lg={10} xl={12} className="mb-24">
            <Card title="俯卧撑成绩等级" bordered={false} >
              <DemoColumn data={stats[1]}/>
            </Card>
          </Col>

          <Col xs={24} sm={15} md={10} lg={10} xl={12} className="mb-24">
            <Card title="原地快跑成绩等级" bordered={false} >
              <DemoColumn data={stats[2]}/>
            </Card>
          </Col>

          <Col xs={24} sm={15} md={10} lg={10} xl={12} className="mb-24">
            <Card title="高抬腿成绩等级" bordered={false} > 
              <DemoPie data={stats[3]}/>
            </Card>
          </Col>

          
        </Row> 

         <Row gutter={[10, 12]}>

         <Col xs={24} sm={15} md={10} lg={10} xl={12} className="mb-24">
            <Card title="仰卧起坐成绩等级" bordered={false} >
              <DemoPie data={stats[4]}/>
            </Card>
          </Col>

          <Col xs={24} sm={15} md={10} lg={10} xl={12} className="mb-24">
            <Card title="单脚站立成绩等级" bordered={false} >
              <DemoColumn data={stats[5]}/>
            </Card>
          </Col>

          <Col xs={24} sm={15} md={10} lg={10} xl={12} className="mb-24">
            <Card title="立位体前屈成绩等级" bordered={false} >
              <DemoColumn data={stats[6]}/>
            </Card>
          </Col>

          <Col xs={24} sm={15} md={10} lg={10} xl={12} className="mb-24">
            <Card title="反应测试成绩等级" bordered={false} > 
              <DemoPie data={stats[7]}/>
            </Card>
          </Col>
        </Row>
    </>
  );
}


const DemoColumn = (props) => {
  const { data } = props;
  const palette = ["#000099","#003399",	"#006699",	"#009999","#00CC99","#00FF99"];
  const config = {
    data,
    xField: 'type',
    yField: 'value',
    // height:20,
    // width: 20,
    // autoFit: false,
    // colorField: 'type', // 部分图表使用 seriesField
    // color: ['#d62728', '#2ca02c', '#000000'],
    // 
    color: ({ type }) => {
      if (type === 'A') {
        return palette[0];
      }
      if (type === 'B') {
        return palette[1];
      }
      if (type === 'C') {
        return palette[2];
      }
      if (type === 'D') {
        return palette[3];
      }
      if (type === 'E') {
        return palette[4];
      }

    },
    xAxis: {
      label: {
        autoHide: true,
        autoRotate: false,
      },
    },
    meta: {
      type: {
        alias: '人数',
      },
      value: {
        alias: '人数',
      },
    },
    minColumnWidth: 20,
    maxColumnWidth: 20,
  };
  return <Column {...config} />;
};


const DemoPie = (props) => {

  const {data} = props;

  function renderStatistic(containerWidth, text, style) {
    const { width: textWidth, height: textHeight } = measureTextWidth(text, style);
    const R = containerWidth / 2; // r^2 = (w / 2)^2 + (h - offsetY)^2

    let scale = 1;

    if (containerWidth < textWidth) {
      scale = Math.min(Math.sqrt(Math.abs(Math.pow(R, 2) / (Math.pow(textWidth / 2, 2) + Math.pow(textHeight, 2)))), 1);
    }

    const textStyleStr = `width:${containerWidth}px;`;
    return `<div style="${textStyleStr};font-size:${scale}em;line-height:${scale < 1 ? 1 : 'inherit'};">${text}</div>`;
  }

  const config = {
    appendPadding: 10,
    data,
    angleField: 'value',
    colorField: 'type',
    radius: 1,
    innerRadius: 0.64,
    label: {
      type: 'spider',
      labelHeight: 28,
      content: '{value}',
    },
    statistic: {
      title: {
        offsetY: -4,
        customHtml: (container, view, datum) => {
          const { width, height } = container.getBoundingClientRect();
          const d = Math.sqrt(Math.pow(width / 2, 2) + Math.pow(height / 2, 2));
          const text = datum ? datum.type : '总人数';
          return renderStatistic(d, text, {
            fontSize: 28,
          });
        },
      },
      content: {
        offsetY: 4,
        style: {
          fontSize: '32px',
        },
        customHtml: (container, view, datum, data) => {
          const { width } = container.getBoundingClientRect();
          const text = datum ? `${(datum.value/data.reduce((r, d) => r + d.value, 0)).toFixed(2)*100}%` : `${data.reduce((r, d) => r + d.value, 0)}`;
          return renderStatistic(width, text, {
            fontSize: 32,
          });
        },
      },
    },
    // 添加 中心统计文本 交互
    interactions: [
      {
        type: 'element-selected',
      },
      {
        type: 'element-active',
      },
      {
        type: 'pie-statistic-active',
      },
    ],
  };
  return <Pie {...config} />;
};

export default Home;
