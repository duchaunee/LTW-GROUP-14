<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>Test</div>
        <button onclick="testJS()">Test js</button>
        <div class="class1">
            
        </div>
    </body>
    
    <script>
        const options = {
        method: 'GET'
        };
        
        function testJS(){
            fetch('http://localhost:8081/api/user', options).then(res => res.json()).then(data => {
                console.log(data)
                for (var i = 0; i < data.length; i++) {
                    console.log(data[i].name)
                }
            });
            const parent = document.querySelector('.class1');
            parent.innerHTML = `<h>PhanThi</h>`;
        }
    </script>
    
    ${data.size()}
</html>

