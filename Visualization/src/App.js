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
import { Switch, Route, Redirect } from "react-router-dom";
import Home from "./pages/Home";
import Info from "./pages/Tables";
// import Billing from "./pages/Billing";
// import Muscle from "./pages/Muscle";
// import Rtl from "./pages/Rtl";
// import Profile from "./pages/Profile";
// import SignUp from "./pages/SignUp";
// import SignIn from "./pages/SignIn";
import Main from "./components/layout/Main";
import TimelineVersion from "./pages/TimelineVersion";
import "antd/dist/antd.css";
import "./assets/styles/main.css";
import "./assets/styles/responsive.css";

function App() {
  return (
    <div className="App">
      <Switch>
        <Main>
          <Route exact path="/时间轴展示" component={TimelineVersion} />
          <Route exact path="/分类筛选" component={Info} />
          {/* <Route exact path="/billing" component={Billing} /> */}
          {/* <Route exact path="/rtl" component={Rtl} /> */}
          {/* <Route exact path="/肌肉数据展示" component={Muscle} /> */}
          {/* <Route exact path="/profile" component={Profile} /> */}
          <Redirect from="*" to="/时间轴展示" />
        </Main>
      </Switch>
    </div>
  );
}

export default App;
