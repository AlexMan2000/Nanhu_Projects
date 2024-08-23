
import { useState,useEffect } from "react";
import React from 'react';
import axios from "axios";
import {Form, Input, Space, Typography  } from 'antd';
import {
  Card,
  Image,
  Tag,
  Button,
  Timeline,
} from "antd";

const { Text, Link, Title } = Typography;

function TimelineVersion() {
    
    const [data, setData] = useState([]);
    const [reverse, setReverse] = useState(false);
    
    const onFinish = (values) => {
      console.log('Success:', values);
      // axios.post("http://projapi.com", values).then(
      //   function(response){
      //     console.log(response.data);
      //   }  
      // )
      axios.get('http://projapi.com', {
        headers: {
          "Access-Control-Allow-Origin":"*",
          "Access-Control-Allow-Headers":"*"
        },
        params: values,
        timeout: 1000,
      }).then((res)=>{
        console.log(res["data"]);

        const group1 = res["data"].filter((elem) => elem["year"]!=="null");
        const group2 = res["data"].filter((elem) => elem["year"]==="null");

        const group1_ = group1.map((elem, index)=>{
          return {
            "year": parseInt(elem["year"]),
            "imgurl": elem["imgurl"],
            "name": elem["name"],
            "region" : elem["region"],
            "customer" : elem["customer"]
          }
        });

        // 数据预处理
        const group1_sorted = group1_.sort((a, b)=>{
          return a["year"] - b["year"];
        });

        setData([group1_sorted, group2]);
      })
    };
    const onFinishFailed = (errorInfo) => {
      console.log('Failed:', errorInfo);
    };

    const handleClick = () => {
      setReverse(!reverse);
    };

    const TimelineItems1 = data.length !== 0 ? data[0].map((elem, index)=>{
        return (
          <Timeline.Item label={elem["year"]} reverse={reverse}>
          <Image src={elem["imgurl"]}>
          </Image>
          <Tag color="default">会展名称: {elem["name"]} </Tag>
          <Tag color="default">地区：{elem["region"]} </Tag>
          <Tag color="default">客户：{elem["customer"]} </Tag>
        </Timeline.Item>
      )}):[];

    const TimelineItems2 = data.length !== 0 ? data[1].map((elem, index)=>{
      return (
        <Timeline.Item label={elem["year"]}>
        <Image src={elem["imgurl"]}>
        </Image>
        <Tag color="default">会展名称: {elem["name"]} </Tag>
        <Tag color="default">地区：{elem["region"]} </Tag>
        <Tag color="default">客户：{elem["customer"]} </Tag>
      </Timeline.Item>
    )}):[];
    
    return (
      <>
      <Space direction="vertical" size="middle" style={{ display: 'flex' }}>
        <Card title={<Title level={3}>过滤器</Title>}>
          <Form
            name="basic"
            labelCol={{
              span: 8,
            }}
            wrapperCol={{
              span: 16,
            }}
            style={{
              maxWidth: 600,
            }}
            initialValues={{
              remember: true,
            }}
            onFinish={onFinish}
            onFinishFailed={onFinishFailed}
            autoComplete="off"
          >
            <Form.Item
              label="展会年份"
              name="year"
            >
              <Input />
            </Form.Item>

            <Form.Item
              label="图片地址"
              name="imgurl"
            >
              <Input />
            </Form.Item>

            <Form.Item
              label="展会名称"
              name="name"
            >
              <Input />
            </Form.Item>

            <Form.Item
              label="展会区域"
              name="region"
            >
              <Input />
            </Form.Item>

            <Form.Item
              label="客户"
              name="customer"
            >
              <Input />
            </Form.Item>

            <Form.Item
              wrapperCol={{
                offset: 8,
                span: 16,
              }}
            >
              <Button type="primary" htmlType="submit">
                Submit
              </Button>
            </Form.Item>
          </Form>
        </Card>
        <Card title={<Title level={3}>按时间展示</Title>}>
            <Timeline mode={"alternate"}>
            {TimelineItems1}           
            </Timeline>
            <Button
              type="primary"
              style={{
                marginTop: 16,
              }}
              onClick={handleClick}
            >
              Toggle Reverse
            </Button>
        </Card>
        
        <Card title={<Title level={3}>时间不详</Title>}>
            <Timeline mode={"alternate"}>
            {TimelineItems2}    
            </Timeline>
        </Card>
      </Space>
    </>);
  }

  export default TimelineVersion;