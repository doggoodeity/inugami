
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html class=" h-100" lang="en" class="bg-dark h-100">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link defer rel="stylesheet" href="static/css/bootstrap.min.css">
        <link rel="stylesheet" href="static/css/style_read.css">
        <title>Inugami</title>      
    </head>

    <body class="d-flex flex-column h-100">
        <style>
            body {
                background-attachment: fixed;
                background-position: 50% 10%;
                background-size: 1500px;
                background-image: url('static/img/bg_box.png');
                background-color:black;
                padding-top: 5em;
            }

            .navbar-toggler-icon {
                background-image: url(static/img/dots-vertical.svg)
            }
        </style>
        <header>
            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid">
                    <a class="navbar-brand-logo col-lg-2" href="home" rel="home">  
                        <img width="600" height="250" src="static/img/logo-mt.png" alt="Inugami">
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse col-lg-8" id="navbarSupportedContent">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link s" href="home" id="all">
                                    All
                                </a>
                            </li>
                            <c:if test="${sessionScope.acc.isUser == 1}">
                                <li class="nav-item">
                                    <a class="nav-link" href="logout" id="login">
                                        Favorites
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.acc.isAdmin == 1}">
                                <li class="nav-item">
                                    <a class="nav-link" href="logout" id="login">
                                        Manage
                                    </a>
                                </li>
                            </c:if>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="About" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Genres</a>
                                <div class="dropdown-menu" aria-labelledby="Genres">
                                    <c:forEach items="${listG}" var="g">
                                        <a class="dropdown-item ${tag == g.genreId ? "active":""}" href="genre?genreId=${g.genreId}">
                                            <c:choose>
                                                <c:when test="${g.genreName eq 'Ecchi'}">
                                                    <c:out value="${g.genreName}"/> <span class="badge badge-danger">18+</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:out value="${g.genreName}"/>
                                                </c:otherwise>
                                            </c:choose>
                                        </a> 
                                    </c:forEach>
                                </div>
                            </li>
                            <div class="pusher"></div>
                            <form action="search" method="post" class="d-flex" style="margin-right: 10em;">
                                <input value="${txtS}" name="txt" class="form-control me-sm-2" type="search" placeholder="Search Inugami..." style="border-radius: 2em;">
                                <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
                            </form>
                            <c:if test="${sessionScope.acc != null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="#">
                                        ${sessionScope.acc.user}
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="logout" id="login">
                                        Logout
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.acc == null}">
                                <li class="nav-item">
                                    <a class="nav-link" href="login.jsp" id="login">
                                        Login
                                    </a>
                                </li>
                            </c:if>
                            <li class="nav-item">
                                <a class="nav-link" href=""><img width="24" height="24" alt="Discord" src="static/img/discord.svg"></img>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="https://twitter.com/ge_eral"><img width="24" height="24" alt="Twitter" src="static/img/twitter.svg"></img>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <style>
            html,
            html.h-100 {
                background-attachment: fixed;
                background-position: 50% 10%;
                background-size: 1500px;
                background-image: url("static/img/bg_box.png");
                background-color: black !important;
            }
        </style>

        <div class="container-fluid page-series">
            <div class="bs-docs-section clearfix mt-1">
                <div class="row justify-content-center">
                    <div class="col-lg-2 col-md-3 col-sm-11 col-xs-12 mb-4 side-cover">
                        <div class="list-item">
                            <div class="list-content">
                                <div class="list-body d-flex justify-content-center">
                                    <span class="text-white text-white font-weight-bold"> </span>
                                </div>
                            </div>
                            <div class="embed-responsive embed-responsive-7by10">
                                <picture>
                                    <source type="image/webp" srcset="${manga.coverImageUrl}" class="card-img-top embed-responsive-item" alt="Manga Cover Image">
                                    <img src="${manga.coverImageUrl}" class="card-img-top embed-responsive-item" alt="Manga Cover Image">   
                                </picture>
                            </div>
                        </div>
                        <div class="card sidecard">
                            <div class="card-body">
                                <table class="table table-borderless table-sm small">
                                    <tbody>
                                        <tr>
                                            <th>Author</th>
                                            <td class="text-sm">${manga.author}</td>
                                        </tr>
                                        <tr>
                                            <th>Artist</th>
                                            <td class="text-sm">${manga.artist}</td>
                                        </tr>
                                        <tr>
                                            <th>Status</th>

                                            <td class="text-sm">${manga.status}</td>
                                        </tr>
                                        <tr>
                                            <th>Release Date</th>
                                            <td class="text-sm">${manga.releaseDate}</td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-8 col-md-7 col-sm-11 col-xs-12 series-content">
                        <article>
                            <h1>${manga.title}</h1>
                            <p style="font-size: 0.9em;">${manga.synopsis}</p>
                            <br/>
                            <br/>
                            <a class="manga-link chapter no-chapter" href="favorite?mangaId=${m.mangaId}">
                                <span class="manga-link-chap"></span><span class="manga-link-text">Add to Favorite</span>
                            </a></article>
                        <div id="detailedView" class="table-responsive">
                            <table id="chapters" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">Title</th>
                                        <th scope="col">Views</th>
                                        <th scope="col">Last Updated</th>
                                    </tr>
                                </thead>
                                <tbody id="chapterTable"></tbody>
                                <c:forEach items="${chapters}" var="c">
                                    <tr class="table-default is-read">
                                        <td scope="row"><a href="/">${c.title}</a></td>
                                        <td scope="row">${c.views}</td>
                                        <td scope="row">${c.releaseDate}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer>
            <script src="static/js/jquery.min.js"></script>
            <script src="static/js/alg_lib.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
            <meta name="referrer" content="same-origin" />
            <script src="static/js/remotestorage.min.js"></script>
            <script src="static/js/widget.min.js"></script>
            <script defer src="https://cdn.jsdelivr.net/npm/vanilla-lazyload@17.3.1/dist/lazyload.min.js"></script>
        </footer>
    </body>
</html>
