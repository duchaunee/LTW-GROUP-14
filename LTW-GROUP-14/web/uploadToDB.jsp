<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<title>Upload files</title>
</head>
<body>

    <div style="padding:5px; color:red;font-style:italic;">
       ${errorMessage}
    </div>
   
    <h2>Upload Files</h2>

    <form method="post" action="${pageContext.request.contextPath}/uploadToDB"
        enctype="multipart/form-data">
       
        Select file to upload:
        <br />
        <input type="file" name="file"  />
        <br />
        <input type="file" name="file" />
        <br />
        <input type="file" name="file" />
        <br />
        <br />
        <br />
        <input type="submit" value="Upload" />
    </form>
   
</body>
</html>
