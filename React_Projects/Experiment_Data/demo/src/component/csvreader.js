import {CSVReader} from "react-csv-reader";
import React from "react";

class ReaderComponent extends React.Component {
    handleFileUpload = (data) => {
      console.log("haha");
      console.log('Parsed CSV:', data);
    }
  
    render() {
      return (
        <div>
          <CSVReader  onFileLoaded={this.handleFileUpload} />
        </div>
      );
    }
}

export default ReaderComponent;
