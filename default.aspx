<%@ Page Language="C#" %>

<%--<script runat="server">
    <%-- This demo page has no server side script 
</script>--%>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset='utf-8' />

    <title>CS5610: Michael Barb</title>

    <style type="text/css">
        ul.master_navigation {
            font-size: 100%;
            font-weight: bold;
            text-align: center;
            list-style: none;
            margin: 0.5em 0;
            padding: 0;
            color: royalblue;
        }

            ul.master_navigation li {
                display: inline-block;
                padding: 0 0.5%;
            }

        a {
            color: royalblue;
            font-weight: bold;
            text-decoration: none;
        }

            a:visited {
                color: lightblue;
            }

            a:hover {
                color: red;
            }

        p {
            text-align: justify;
        }
    </style>

    <style type="text/css" media="screen">
        body {
            width: 900px;
            max-width: 100%;
            margin: 0;
            padding: 0;
        }

        .pad {
            padding: 10px;
        }
    </style>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="The description of my page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>

<body>

    <div class="pad">

        <form id="form1" runat="server">
            <div>
                <ul class="master_navigation">
                    <li>|&nbsp;</li>
                    <li><a href="sitestatistics/" target="_blank">SiteStatistics</a></li>
                    <li>&nbsp;|&nbsp;</li>
                    <li><a href="statistics/" target="_blank">Statistics</a></li>
                    <li>&nbsp;|&nbsp;</li>
                    <li><a href="source/" target="_blank">Source</a></li>
                    <li>&nbsp;|&nbsp;</li>
                    <li><a href="search/" target="_blank">Search</a></li>
                    <li>&nbsp;|&nbsp;</li>
                    <li><a href="searchtree/" target="_blank">SearchTree</a></li>
                    <li>&nbsp;|&nbsp;</li>
                    <li><a href="textview/" target="_blank">TextView</a></li>
                    <li>&nbsp;|&nbsp;</li>
                    <li><a href="filelist.aspx" target="_blank">FileList</a></li>
                    <li>&nbsp;|&nbsp;</li>
                    <li><a href="autofile.aspx" target="_blank">AutoFile</a></li>
                    <li>&nbsp;|&nbsp;</li>
                    <li><a href="images/autoimage.aspx" target="_blank">Images</a></li>
                    <li>&nbsp;|&nbsp;</li>
                    <li><a href="blog/" target="_blank">Blog</a></li>
                    <li>&nbsp;|</li>
                </ul>

                <hr />

                <%--                <a href="myTests/Week02/MasterPage/Default.aspx">First Test</a>
                <br />--%>
                <a href="story/index.htm?../myStories/experiments.txt" target="_blank">Experiments</a>
                <hr />
                <img alt="" src="myImage/myPicture.jpg" />
                <hr />
                <p>
                    <b>Not much work has been done on the home page yet.  Mostly at this point is is just to meet first week minimum requirements.</b>
                </p>
                <hr />
                <br />
                <br />
                <br />
                <p>
                    <b>This demo page shows the navigation links that should appear
                    on the home page.</b>
                    It is not necessary that these links be at the top of the page
                    but they should be displayed nicely and be easy to find.  You
                    may alter the CSS on the page to change the placement and the
                    size of the links.
                </p>

                <hr />

                <p>
                    The home page may show some interesting content but its main
                    purpose should be to <i>provide navigation</i> to other pages
                    on your site.
                </p>

                <hr />

                <p>
                    It would be helpful if your home page shows your name and a
                    photo of yourself.  This will help us to get to know you. 
                </p>

                <hr />

                <p>
                    Here is a link to the
                    <a href="story/index.htm" target="_blank">Story Utility</a>
                    on this site so that you may explore this tool.
                </p>

                <p>
                    Here is a link to the
                    <a href="http://www.northeastern.edu/rasala/webstories.htm"
                        target="_blank">Web Development Stories</a>
                    so that you may see a good collection of online documentation.
                </p>

                <p>
                    This provides a model for using stories for documentation and for collections of experiments.
                </p>

                <hr />

                <p>
                    None of the hints given above needs to be on your home page
                    downstream but it is convenient to have them here at startup.
                </p>

            </div>

        </form>

    </div>

</body>
</html>
