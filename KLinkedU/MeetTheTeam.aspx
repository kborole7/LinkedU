<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MeetTheTeam.aspx.cs" Inherits="KLinkedU.MeetTheTeam" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
<style>
html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 25%;
  margin-bottom: 16px;
  padding: 0 8px;
}

body {
  margin: 0;
  background-color:aliceblue;
}
  .header {
           
    background-color: darkblue;
    text-align: center;
    padding: 20px;
    color:white
}
     

@media (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}
</style>
</head>
<body>
     <div class="header" style="font-family:Imprint MT Shadow ; font-size:xx-large">
            LinkedU       
        </div>

<h1 style="text-align:center">Meet The Team!  </h1>
<br/>

<div class="row">
  <div class="column">
    <div class="card">
      <img src="./images/Kaustubh.jpg" alt="Kaustubh" style="width:100% ; height:250px"/>
      <div class="container">
        <h2>Kaustubh Borole</h2>
        <p class="title">Web Developer</p>
         <p>M.S. Information Systems</p>
              <p>Illinois State University</p>
        <p>kpborol@ilstu.edu</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>

  <div class="column">
      <div class="card">
          <img src="./images/Rohan.jpg" alt="Rohan" style="width: 100% ; height:250px"/>
          <div class="container">
              <h2>Rohan Pisal</h2>
              <p class="title">Web Developer</p>
              <p>M.S. Information Systems</p>
              <p>Illinois State University</p>
              <p>rvpisal@ilstu.edu</p>
              <p>
                  <button class="button">Contact</button></p>
          </div>
      </div>
  </div>
  <div class="column">
    <div class="card">
      <img src="./images/Shweta.jpg" alt="Shweta" style="width:100% ; height:250px"/>
      <div class="container">
        <h2>Shweta Nalawde</h2>
        <p class="title">Web Developer</p>
         <p>M.S. Information Systems</p>
              <p>Illinois State University</p>
        <p>ssnalaw@ilstu.edu</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>

<div class="column">
    <div class="card">
      <img src="./images/Dheeraj.jpg" alt="Dheeraj" style="width:100% ; height:250px"/>
      <div class="container">
        <h2>Dheeraj Patil</h2>
        <p class="title">Web Developer</p>
        <p>M.S. Information Systems</p>
              <p>Illinois State University</p>
        <p>djpatil@ilstu.edu</p>
        <p><button class="button">Contact</button></p>
      </div>
    </div>
  </div>






</div>

</body>
</html>
