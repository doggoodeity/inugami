<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class=" h-100" lang="en" class="bg-dark h-100">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link defer rel="stylesheet" href="static/css/bootstrap.min.css">
        <link rel="stylesheet" href="static/css/style.css">
        <title>Inugami</title>      
    </head>

    <body class="d-flex flex-column h-100">
        <style>


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
                        <ul class="navbar-nav me-auto">
                            <li class="nav-item">
                                <a class="nav-link s" href="home" id="all">
                                    All
                                </a>
                            </li>
                            <c:if test="${sessionScope.acc.isUser == 1}">
                                <li class="nav-item">
                                    <a class="nav-link" href="favorites" id="favorites">
                                        Favorites
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.acc.isAdmin == 1}">
                                <li class="nav-item">
                                    <a class="nav-link" href="manage" id="manage">
                                        Manage
                                    </a>
                                </li>
                            </c:if>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="About" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Genres</a>
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
                    <div class="col-lg-8 col-md-7 col-sm-11 col-xs-12 series-content">
                        <!-- EDIT FORM -->
                        <div id="editFormContainer">
                            <div id="editFormContent">
                                <form action="edit" id="editForm" method="POST">
                                    <h3><strong>Update Manga's Info</strong></h3>
                                    <br/>
                                    <table>
                                        <tr>
                                        <tr>
                                            <td><strong>Manga ID:</strong></td>
                                            <td><input value="${manga.mangaId}" type="text" name="mangaId" required readonly></td>
                                        </tr>
                                        </tr>
                                        <tr>
                                            <td><strong>Title:</strong></td>
                                            <td><input value="${manga.title}" type="text" name="title" required></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Synopsis:</strong></td>
                                            <td><input value="${manga.synopsis}" name="synopsis" rows="4" cols="50">${m.synopsis}</textarea></td>
                                        </tr>
                                        <tr>
                                            <td><strong>Cover Image URL:</strong></td>
                                            <td><input value="${manga.coverImageUrl}" type="text" name="coverImageUrl" required>${m.coverImageUrl}</td>
                                        </tr>
                                        <tr>
                                            <td><strong>Release Date:</strong></td>
                                            <td><input value="${manga.releaseDate}" type="date"name="releaseDate">${m.releaseDate}</td>
                                        </tr>
                                        <tr>
                                            <td><strong>Status:</strong></td>
                                            <td>
                                                <select name="status" required>
                                                    <option value="Ongoing">Ongoing</option>
                                                    <option value="Completed">Completed</option>
                                                    <option value="Hiatus">Hiatus</option>
                                                    <option value="Cancelled">Cancelled</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><strong>Author:</strong></td>
                                            <td><input value="${manga.author}" type="text" name="author" required>${m.author}</td>
                                        </tr>
                                        <tr>
                                            <td><strong>Artist:</strong></td>
                                            <td><input value="${manga.artist}" type="text" name="artist" required${m.artist}td>
                                        </tr>
                                        <tr>
                                            <td><strong>Genre:</strong></td>
                                            <td>
                                                <c:forEach items="${listG}" var="g">
                                                    <input type="checkbox" name="genre" value="${g.genreId}" >
                                                    ${g.genreName}
                                                </c:forEach>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <button type="submit" class="btn btn-primary">Update</button>
                                                <button type="button" id="cancelEdit" class="btn btn-secondary" onclick="hideForm()">Cancel</button>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                            </div>
                        </div>

                        <br/>
                        <br/>
                        <br/>
                        <button class="btn btn-secondary my-2 my-sm-0 add-btn">Add a new Series</button>
                        <br/>
                        <br/>
                        <br/>
                        <table id="chapters" class="table table-hover">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th scope="col">Series&nbsp;&nbsp;&nbsp;&nbsp;</th>
                                    <th scope="col">
                                        Author
                                    </th>
                                    <th scope="col">
                                        Artist
                                    </th>
                                    <th scope="col">
                                        Action
                                    </th>
                                </tr>
                            </thead>
                            <tbody id="chapterTable">
                                <c:forEach items="${listM}" var="m">
                                    <tr>
                                        <td scope="row"></td>
                                        <td scope="row" class="chapter-title">${m.title}</td>
                                        <td scope="row">${m.author}</td>
                                        <td scope="row">${m.artist}</td>
                                        <td scope="row"><a href="loadManga?mangaId=${m.mangaId}" class="btn btn-secondary my-2 my-sm-0 edit-btn">Edit</a></td>
                                        <td scope="row"><a href="delete?mangaId=${m.mangaId}" class="btn btn-secondary my-2 my-sm-0">Delete</a></td>                                        
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <script>
            document.addEventListener('click', function (event) {
                if (event.target.id === 'cancelEdit') {
                    hideForm(); // Call hideForm to hide forms
                }
            });

            function hideForm() {
                var editForm = document.getElementById('editForm');
                var addForm = document.getElementById('addForm');
                if (editForm)
                    editForm.style.display = 'none'; // Hide the edit form if it exists
                if (addForm)
                    addForm.style.display = 'none'; // Hide the add form if it exists
            }
        </script>




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