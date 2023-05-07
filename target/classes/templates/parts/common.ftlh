<#macro page>
    <!doctype html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css"
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous">
        <#--OWL Carousel-->
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
              integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
              integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
              crossorigin="anonymous" referrerpolicy="no-referrer"/>
        <style type="text/css">
            html {
                min-height: 100%;

            }

            body {
                background-image: url("https://phonoteka.org/uploads/posts/2021-05/1621914621_21-phonoteka_org-p-fon-dlya-prezentatsii-aeroport-22.jpg");
                background-size: cover;
                background-attachment: fixed;
                /*background: linear-gradient(to bottom left, lightskyblue, #fff) scroll;*/
            }
            footer {
                position:fixed;
                left:0px;
                bottom:0px;
                height:30px;
                width:100%;
            }
        </style>


        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


        <title>Lopareva-AirLines</title>
    </head>
    <body>
    <#include "navbar.ftlh">

    <div class="container mt-5">
        <#nested >
    </div>


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"
            integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>

    </body>
    <footer>
        <p class="text-right mr-4 text-muted"><small><a href="https://www.instagram.com/yonaastyaa/" style="color: white">by Anastasia Lopareva</a></small></p>
    </footer>
    </html>
</#macro>