<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/view/template/header.jsp"></jsp:include>

<h1>회원가입 페이지</h1>
<html>
	<head>
		<title>서울옥션</title>
		<style>
			.header{
				align-content: center;
				border-top: 2px solid black;
				border-bottom: 1px solid black;
				margin: 0px;
				padding: 2px;
				height: 70px;
				text-align: center;
			}
			
			.main_name{
				text-align: center;
			}
			
			.menu-link, .main-link{
				text-decoration: none;
				color: black;
			}
			
			li{
				list-style: none;
				float: left;
				padding-left: 10px;
				padding-right: 10px;
			}
			
			ul{
				list-style: none;
			}
			
			.main_name{
				margin: 10px;
			}
			
			.login{
				text-align: center;
				padding-top: 20px;
			}
			
			.login-content{
				align-items: center;
			}
			
		</style>
	</head>
    <body>
			<div class="header">
				<h1 class="main_name">
					<a href="" class="main-link">
						<span>Seoul Auction</span>
					</a>
				</h1>
				<div class="nav">
					<!--링크 클릭시 사이드메뉴로 하위 메뉴가 나옴-->
					<ul>
						<li>
							<span>
								<a href="#" class="menu-link">Auction</a>
							</span>
						</li>
						<li>
							<span>
								<a href="#" class="menu-link">Online</a>
							</span>
						</li>
						<li>
							<span>
								<a href="#" class="menu-link">How To</a>
							</span>
						</li>
						<li>
							<span>
								<a href="#" class="menu-link">Service</a>
							</span>
						</li>
						<li>
							<span>
								<a href="#" class="menu-link">About</a>
							</span>
						</li>
					</ul>
				</div>
			</div>
			<br>
			<div class="login">
				로그인 | 회원가입
			</div>
			<div class="login-content">
				<table border="1">
					<tbody align="center">
						<td>
							<img src="https://placehold.it/50x50" alt="">
							<h3>로그인</h3>
							<p>회원이시면 아이디와 비밀번호를 입력해주세요</p>
							<div>
								<form method="post" action="/login">
								<input type="text" placeholder="아이디 입력하기"><br>
								<input type="password" placeholder="비밀번호 입력하기">
								<button type="submit">로그인</button>
								</form>
								<!-->팝업창으로 나옴</!-->
								<p>아이디 찾기 | 비밀번호 찾기</p>
							</div>
						</td>
						<td>
							<img src="https://placehold.it/50x50" alt="">
							<h3>회원가입</h3>
							<p>경매 참여를 위해서는 회원으로 가입해주셔야 합니다.</p>
							<p>지금 회원으로 가입해 주세요.</p>
							<div>
								<!-- 링크로 해당 페이지 연결 -->
								<a href="#"><button>경매안내</button></a>
								<a href="#"><button>지금 회원가입하기</button></a>
							</div>
						</td>
					</tbody>
				</table>
			</div>
    
    </body>
</html>

<jsp:include page="/WEB-INF/view/template/footer.jsp"></jsp:include>