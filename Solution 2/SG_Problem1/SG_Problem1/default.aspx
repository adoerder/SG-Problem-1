<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="SG_Problem1._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>SG Problem 1</title>

	<style>
		form {
			padding-left:15px;
			padding-right:15px;
		}

		hr {
			margin-top: 20px;
			margin-bottom: 20px;
		}
	</style>
</head>
<body>
	<form id="form1" runat="server">
		
		<div>
			<h3>SG Problem 1:</h3>
			<strong>Description</strong><br />
			Given a list of people with their birth and end years (all between 1900 and 2000), find the year with the most number of people alive.
			<br /><br />
			<strong>Code</strong><br />
			Solve using a language of your choice and dataset of your own creation.
			<br /><br />
			<strong>Submission</strong><br />
			Please upload your code, dataset, and example of the program’s output to Bit Bucket or Github. Please include any graphs or charts created by your program.
		</div>

		<hr style="border-color:black;" />
		
		<div>
			<asp:Label ID="lblNumberOfPeople" runat="server" Text="Enter a number of people:"></asp:Label>
			<asp:TextBox ID="txtNumberOfPoeple" runat="server" MaxLength="5" Width="80"></asp:TextBox>
			<asp:Button ID="btnSeedNewDataset" runat="server" Text="Seed a new dataset & determine the answer" OnClick="btnSeedNewDataset_Click" />
		</div>
		
		<hr />
		
		<div>
			The answer:<br />
			<asp:Label ID="lblTheAnswer" runat="server"></asp:Label>
		</div>
		
		<hr />

		<div>
			Current dataset:<br />
			<asp:Literal ID="litCurrentDataset" runat="server"></asp:Literal>
		</div>

	</form>
</body>
</html>
