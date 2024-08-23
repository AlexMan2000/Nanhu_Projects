import { Switch, Route, Redirect } from "react-router-dom";
import Home from "./pages/Home";
import Info from "./pages/Tables";
import Muscle from "./pages/Muscle";
import Main from "./components/layout/Main";
import "antd/dist/antd.css";
import "./assets/styles/main.css";
import "./assets/styles/responsive.css";

function App() {
  return (
    <div className="App">
      <Switch>
        <Main>
          <Route exact path="/运动项目数据" component={Home} />
          <Route exact path="/学生信息数据" component={Info} />
          <Route exact path="/肌肉数据展示" component={Muscle} />
          <Redirect from="*" to="/运动项目数据" />
        </Main>
      </Switch>
    </div>
  );
}

export default App;
