import React, { Component, PropTypes } from 'react';
import ReactDOM from 'react-dom';
import $ from 'jquery';
import './menu.css'
const baseUrl = window.location.origin;
class ButtomLeft extends Component {
	constructor(props) {
		super(props)
		this.state = { data: [], lang: "" }
	}
	get_locale() {
		fetch(baseUrl + '/get_lng').then(response => {
			response.json().then(json => {
				this.setState({ lang: json })
			});
		});
	}
	componentWillMount() {
		this.get_locale()
	}
	componentDidMount() {
		var url_string = window.location.href;
		var url = new URL(url_string);
		var url_str = url.href;		
	}
	render() {






		const img_w1 = { "backgroundSize": "1080px 60px" };
		const img_w2 = { "backgroundSize": "1380px 60px" };
		const hidden = 	{ "display": "none" };
		const font_s = { "fontSize": "23px" };
		const mar_s = { "margin": "0 5px 0 0" };
		const first_menu = { "left": "auto" };
		const img_w = this.state.lang == 'en' ? img_w2 : img_w1;








		
		return (
			<header id="demo"   >
				<nav className="navbar fixed-top navbar-expand-lg navbar-light bg-light" id="nccc" style={img_w}>
					<div className="container-fluid"   >
						<div className="menu-logo">
							<div className="navbar-brand">
								<span className="navbar-logo">
									<a href="/">
										<img src="images/logo.png" />
									</a>
								</span>
							</div>
						</div>
						<button className="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
							<span className="navbar-toggler-icon"></span>
						</button>
						<div className="collapse navbar-collapse" id="navbarTogglerDemo02" style={font_s}>
							<ul className="navbar-nav">
								<li className="nav-item" style={{"display":"none"}}  >
									<a className="nav-link" href="/annos" style={font_s}>{(this.state.lang != 'en') ? '永久磁鐵' : "Permanent Magnet"}</a>
								</li>
								<li class="nav-item dropdown"style={mar_s} >
									<a className="nav-link dropdown-toggle" href="#" id="navbarDropdown" 
										style={font_s} role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										{(this.state.lang != 'en') ? ' 事業體' : "Bussiness"}
       								</a>
									<div className="dropdown-menu" aria-labelledby="navbarDropdown" style={first_menu} >
										<a href="http://www.thmageq.com/product_main?p=2" className="dropdown-item" style={font_s} >
											{(this.state.lang != 'en') ? '半導體' : "Semiconductor"}
										</a>
										<a href="http://www.thmageq.com/product_main?p=1" className="dropdown-item" style={font_s} >
											{(this.state.lang != 'en') ? '磁性金屬分離器' : "Magnetic material"}
										</a>
										<a href="http://www.taihanmag.com/" className="dropdown-item" style={font_s} >
											{(this.state.lang != 'en') ? '永久磁鐵' : "Magnet"}
										</a>
									</div>
								</li>
								<li className="nav-item" style={mar_s}  >
									<a className="nav-link" href="/magnetism2" style={font_s}>{(this.state.lang != 'en') ? '磁力計算器' : "Magnet Calculator"}</a>
								</li>
								<li className="nav-item " style={mar_s} >
									<a className="nav-link" href="/application_main" style={font_s}>{(this.state.lang != 'en') ? '應用' : "Application"}</a>
								</li>
								<li className="nav-item " style={mar_s}  >
									<a className="nav-link" href="/glossary" style={font_s} > {(this.state.lang != 'en') ? '詞彙表' : "Glossary"}</a>
								</li>
								<li className="nav-item " style={mar_s} >
									<a className="nav-link" href="/contact" style={font_s}>{(this.state.lang != 'en') ? '聯繫我們' : "Contact Us"}</a>
								</li>

								<li className="nav-item " style={mar_s} >
									<a className="nav-link" href={'/company'} style={font_s}>{(this.state.lang != 'en') ? '公司' : " Company"}</a>
								</li>

								<li className="nav-item dropdown" style={mar_s} >
									<a className="nav-link dropdown-toggle" href="#" id="navbarDropdown" 
										style={font_s} role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Language
       								</a>
									<div className="dropdown-menu" aria-labelledby="navbarDropdown">
										<a href={'/?locale=en'} className="dropdown-item" style={font_s}  >English</a>
										<a href={'/?locale=zh-TW'} className="dropdown-item" style={font_s} >繁體中文</a>

									</div>
								</li>
							</ul>
						</div>
					</div>
				</nav>
			</header>
		);
	}
}


ReactDOM.render(
	<ButtomLeft />,
	document.getElementById('headderr')
);
