import { Route, Routes } from "react-router-dom";

function DetailContent() {
    return (
        <div>
             <Routes>
                <Route path="/" element={<div>1</div>}></Route>
                <Route path="/HistoryAnalysis" element={<div>2</div>}></Route>
                <Route path="/PeoplewiseComparison" element={<div>3</div>}></Route>
             </Routes>
        </div>
    )
}

export default DetailContent;