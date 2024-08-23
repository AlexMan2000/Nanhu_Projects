import {
  AppstoreOutlined,
  ShopOutlined,
  ShoppingCartOutlined,
  UserOutlined,
  LineChartOutlined
} from "@ant-design/icons";
import { Menu } from "antd";
import { useEffect, useState } from "react";
import { useLocation, useNavigate } from "react-router-dom";

function SideMenu() {
  const location = useLocation();
  const [selectedKeys, setSelectedKeys] = useState("/");

  useEffect(() => {
    const pathName = location.pathname;
    setSelectedKeys(pathName);
  }, [location.pathname]);

  const navigate = useNavigate();
  return (
    <div className="SideMenu">
      <Menu
        className="SideMenuVertical"
        mode="vertical"
        onClick={(item) => {
          //item.key
          navigate(item.key);
        }}
        selectedKeys={[selectedKeys]}
        items={[
          {
            label: "Dashbaord",
            icon: <AppstoreOutlined />,
            key: "/",
          },
          // {
          //   label: "History Records",
          //   key: "/history",
          //   icon: <ShopOutlined />,
          // },
          {
            label: "项目成绩",
            key: "/people",
            icon: <ShoppingCartOutlined />,
          },
          {
            label: "统计数据",
            key: "/customers",
            icon: <LineChartOutlined />,
          },
        ]}
      ></Menu>
    </div>
  );
}
export default SideMenu;
