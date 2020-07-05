import React from "react";
import ReactDOM from "react-dom";

class BraaPage extends React.Component{
  render(){
    return( <div className="main"> 메인페이지 </div>);
    
  }
}

ReactDOM.render(<BraaPage/>, document.getElementById('root'));
