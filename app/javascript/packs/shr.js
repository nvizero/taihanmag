import React, {Component, PropTypes} from 'react';
import ReactDOM  from 'react-dom';
import Iframe from 'react-iframe'


class Shr extends Component {

	constructor(props) {
		super(props)
	}
	render() {
  	   return (<div>
								<Iframe url="http://house.annaler.com/j/magnetism.html"
										width="1200px"
										height="1200px"
										frameBorder="0"
										id="myId"
										className="myClassname" />
       					</div>
     );
	}
}


ReactDOM.render(<Shr />,	document.getElementById('showee'));
