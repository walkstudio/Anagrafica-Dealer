<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DettaglioStorico.ascx.cs" Inherits="Spindox.AnagraficaDealer.UserControl.DettaglioDealer.DettaglioStorico" %>

    <link href="../../Resources/Stylesheets/DettaglioDealer.css" rel="stylesheet" />

    <script type="text/javascript">

        function BindEvents() {
            gridviewScroll();
        } 

        $(document).ready(function () {
            gridviewScroll();
        });

        function gridviewScroll() {
            $('#<%=storicoGridView.ClientID%>').gridviewScroll({
                width: 620,
                height: 310,
                freezesize: 0,
                arrowsize: 30,
                varrowtopimg: "Resources/Images/arrowvt.png",
                varrowbottomimg: "Resources/Images/arrowvb.png",
                harrowleftimg: "Resources/Images/arrowhl.png",
                harrowrightimg: "Resources/Images/arrowhr.png",
                headerrowcount: 1,
                verticalbar: "auto",
                horizontalbar: "hidden",
                wrapperAutoHeight: false
            });
        }

    </script>

<style type="text/css">
.GridviewScrollHeader TH, .GridviewScrollHeader TD
{
    padding: 2px;

    padding-left: 10px;
    padding-right: 10px;

    padding-top: 5px;
    padding-bottom: 5px;
    font-weight: bold;
    white-space: nowrap;
    /*border-right: 1px solid #E6E7E8;*/
    border-bottom: 1px solid #E6E7E8;
    background-color: #EFEFEF;
    vertical-align: central;
    text-align: center;

    /*AGGIUNTO*/
   
    font-size:small;
    height:25px;
}
.GridviewScrollItem TD
{
    padding: 2px;
    white-space: nowrap;
    /*border-right: 1px solid #E6E7E8;*/
    border-bottom: 1px solid #E6E7E8;
    background-color: #FFFFFF;

    /*AGGIUNTO*/
     padding-left: 10px;
    padding-right: 10px;
    height:25px;
    text-align: center;
    font-size:small;
    /*cursor: pointer;*/
}


</style>

<div>
    <div style="padding: 5px; margin: 10px; text-align: left">
        <asp:Label ID="Label1" runat="server" CssClass="labelSezioniDD" Text="STORICO MODIFICHE:"></asp:Label>
        &nbsp;<asp:DropDownList ID="tipologiaDropDownList" runat="server" AutoPostBack="True" CssClass="dropDownListMediumDD">
            <asp:ListItem Selected="True">Tutte</asp:ListItem>
            <asp:ListItem Value="Canale">Cambio Canale</asp:ListItem>
            <asp:ListItem Value="Codice">Subentro</asp:ListItem>
            <asp:ListItem Value="Indirizzo">Trasloco</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div>
        <asp:GridView ID="storicoGridView" runat="server" AutoGenerateColumns="False" GridLines="None" Width="600px" ShowHeaderWhenEmpty="True">
            <Columns>
                <asp:BoundField DataField="Data" DataFormatString="{0:d}" HeaderText="Data" SortExpression="Data">
                    <ItemStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="Tipologia" HeaderText="Variazione" SortExpression="Tipologia">
                    <ItemStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="Variazione" HeaderText="Vecchio Dato" SortExpression="Variazione">
                    <ItemStyle Width="300px" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle CssClass="GridviewScrollHeader" />
            <RowStyle CssClass="GridviewScrollItem" />
            <PagerStyle CssClass="GridviewScrollPager" />
        </asp:GridView>
    </div>
</div>
