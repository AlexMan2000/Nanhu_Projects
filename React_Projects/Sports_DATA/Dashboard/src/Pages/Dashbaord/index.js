import {
  DollarCircleOutlined,
  ShoppingCartOutlined,
  ShoppingOutlined,
  UserOutlined,
} from "@ant-design/icons";
import { Card, Space, Statistic, Table, Typography,Col, Row } from "antd";
import { useEffect, useState } from "react";
import { getCustomers, getInventory, getOrders, getRevenue } from "../../API";

import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend,
} from "chart.js";

import { Bar } from "react-chartjs-2";
import { Pie, measureTextWidth, Column } from '@ant-design/plots';



ChartJS.register(
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend
);

function Dashboard() {
  const [orders, setOrders] = useState(0);
  const [inventory, setInventory] = useState(0);
  const [customers, setCustomers] = useState(0);
  const [revenue, setRevenue] = useState(0);

  useEffect(() => {
    // getOrders().then((res) => {
    //   setOrders(res.total);
    //   setRevenue(res.discountedTotal);
    // });
    // getInventory().then((res) => {
    //   setInventory(res.total);
    // });
    // getCustomers().then((res) => {
    //   setCustomers(res.total);
    // });
  }, []);

  const pushup = [
    {
      type: 'A',
      value: 0,
    },
    {
      type: 'B',
      value: 3,
    },
    {
      type: 'C',
      value: 6,
    },
    {
      type: 'D',
      value: 5,
    },
    {
      type: 'E',
      value: 1,
    },
  ];

  return (
    <Row>
    <Col span={6}>col-6</Col>
    <Col span={6}>col-6</Col>
    <Col span={6}>col-6</Col>
    <Col span={6}>col-6</Col>
  </Row>
  );
    // <Space size={20} direction="vertical">
    //   <Typography.Title level={4}>运动项目数据</Typography.Title>
        {/* <Row >
          <Col>
            <Card title="俯卧撑成绩等级" bordered={false} >
              <DemoColumn data={pushup}/>
            </Card>
          </Col>

          <Col>
            <Card title="俯卧撑成绩等级" bordered={false} >
              <DemoPie/>
            </Card>
          </Col>

          <Col >
            <Card title="俯卧撑成绩等级" bordered={false} > 
              <DemoColumn data={pushup}/>
            </Card>
          </Col>

          <Col>
            <Card title="俯卧撑成绩等级" bordered={false} >
              <DemoPie/>
            </Card>
          </Col>
        </Row> */}

        {/* <Row gutter={[24, 12]}>
          <Col xs={24} sm={15} md={10} lg={10} xl={6} className="mb-24">
            <Card title="俯卧撑成绩等级" bordered={false} >
              <DemoColumn data={pushup}/>
            </Card>
          </Col>

          <Col xs={24} sm={15} md={10} lg={10} xl={6} className="mb-24">
            <Card title="俯卧撑成绩等级" bordered={false} >
              <DemoPie/>
            </Card>
          </Col>

          <Col xs={24} sm={15} md={10} lg={10} xl={6} className="mb-24">
            <Card title="俯卧撑成绩等级" bordered={false} > 
              <DemoColumn data={pushup}/>
            </Card>
          </Col>

          <Col>
            <Card title="俯卧撑成绩等级" bordered={false} >
              <DemoPie/>
            </Card>
          </Col>
          
        </Row> */}
    // </Space>
}


const DemoColumn = (props) => {
  const { data } = props;
  // const data = [
  //   {
  //     type: 'A',
  //     value: 0,
  //   },
  //   {
  //     type: 'B',
  //     value: 3,
  //   },
  //   {
  //     type: 'C',
  //     value: 6,
  //   },
  //   {
  //     type: 'D',
  //     value: 5,
  //   },
  //   {
  //     type: 'E',
  //     value: 1,
  //   },
  // ];
  const config = {
    data,
    xField: 'type',
    yField: 'value',
    // height:20,
    // width: 20,
    // autoFit: false,
    xAxis: {
      label: {
        autoHide: true,
        autoRotate: false,
      },
    },
    meta: {
      type: {
        alias: '类别',
      },
      sales: {
        alias: '销售额',
      },
    },
    minColumnWidth: 20,
    maxColumnWidth: 20,
  };
  return <Column {...config} />;
};


const DemoPie = () => {
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

  const data = [
    {
      type: 'A',
      value: 0,
    },
    {
      type: 'B',
      value: 3,
    },
    {
      type: 'C',
      value: 6,
    },
    {
      type: 'D',
      value: 5,
    },
    {
      type: 'E',
      value: 1,
    },
  ];
  const config = {
    appendPadding: 10,
    data,
    angleField: 'value',
    colorField: 'type',
    radius: 1,
    innerRadius: 0.64,
    meta: {
      value: {
        formatter: (v) => `${v} ¥`,
      },
    },
    label: {
      type: 'inner',
      offset: '-50%',
      style: {
        textAlign: 'center',
      },
      autoRotate: false,
      content: '{value}',
    },
    statistic: {
      title: {
        offsetY: -4,
        customHtml: (container, view, datum) => {
          const { width, height } = container.getBoundingClientRect();
          const d = Math.sqrt(Math.pow(width / 2, 2) + Math.pow(height / 2, 2));
          const text = datum ? datum.type : '总计';
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
          const text = datum ? `¥ ${datum.value}` : `¥ ${data.reduce((r, d) => r + d.value, 0)}`;
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
function RecentOrders() {
  const [dataSource, setDataSource] = useState([]);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    setLoading(true);
    getOrders().then((res) => {
      setDataSource(res.products.splice(0, 3));
      setLoading(false);
    });
  }, []);

  return (
    <>
      <Typography.Text>Recent Orders</Typography.Text>
      <Table
        columns={[
          {
            title: "Title",
            dataIndex: "title",
          },
          {
            title: "Quantity",
            dataIndex: "quantity",
          },
          {
            title: "Price",
            dataIndex: "discountedPrice",
          },
        ]}
        loading={loading}
        dataSource={dataSource}
        pagination={false}
      ></Table>
    </>
  );
}

function DashboardChart() {
  const [reveneuData, setReveneuData] = useState({
    labels: [],
    datasets: [],
  });

  useEffect(() => {
    getRevenue().then((res) => {
      const labels = res.carts.map((cart) => {
        return `User-${cart.userId}`;
      });
      const data = res.carts.map((cart) => {
        return cart.discountedTotal;
      });

      const dataSource = {
        labels,
        datasets: [
          {
            label: "Revenue",
            data: data,
            backgroundColor: "rgba(255, 0, 0, 1)",
          },
        ],
      };

      setReveneuData(dataSource);
    });
  }, []);

  const options = {
    responsive: true,
    plugins: {
      legend: {
        position: "bottom",
      },
      title: {
        display: true,
        text: "Order Revenue",
      },
    },
  };

  return (
    <Card style={{ width: 500, height: 250 }}>
      <Bar options={options} data={reveneuData} />
    </Card>
  );
}
export default Dashboard;
