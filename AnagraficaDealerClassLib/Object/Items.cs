using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace AnagraficaDealerClassLib
{

    public class Utente
    {
        [DataMember]
        public int IDUtente { set; get; }

        [DataMember]
        public string Nome { set; get; }

        [DataMember]
        public string Cognome { set; get; }

        [DataMember]
        public string Email { set; get; }

        [DataMember]
        public string UserID { set; get; }

        [DataMember]
        public int IDProfilo { set; get; }

        [DataMember]
        public bool Attivo { set; get; }
    }

    public class Profilo
    {
        [DataMember]
        public int IDProfilo { set; get; }

        [DataMember]
        public string NomeProfilo { set; get; }

        [DataMember]
        public bool ArchivioDatabase { set; get; }

        [DataMember]
        public bool ArchivioCruscotto { set; get; }

        [DataMember]
        public bool ReportAnomalie { set; get; }

        [DataMember]
        public bool ReportScarti { set; get; }

        [DataMember]
        public bool Portafoglio { set; get; }

        [DataMember]
        public bool Amministrazione { set; get; }

        [DataMember]
        public int RagioniSocialiCorrelate { set; get; }

        [DataMember]
        public bool Eccezioni { set; get; }
    }

    public class TipoDealer
    {
        [DataMember]
        public int IDTipoDealer { set; get; }

        [DataMember]
        public string NomeTipoDealer { set; get; }
    }

    public class Dealer
    {
        [DataMember]
        public int IDDealer { set; get; }

        [DataMember]
        public string Codice { set; get; }

        [DataMember]
        public string Indirizzo { set; get; }

        [DataMember]
        public string PIVA { set; get; }

        [DataMember]
        public string Telefono { set; get; }

        [DataMember]
        public string Fax { set; get; }

        [DataMember]
        public int IDTipoDealer { set; get; }

        [DataMember]
        public string NomeTipoDealer { set; get; }

        [DataMember]
        public int IDUtente { set; get; }

        [DataMember]
        public int IDStato { set; get; }

        [DataMember]
        public string NomeStato { set; get; }
    }

    public class Relazioni
    {
        [DataMember]
        public int IDRelazione { set; get; }

        [DataMember]
        public string NomeRelazione { set; get; }

        [DataMember]
        public int IDDealerConsumer { set; get; }

        [DataMember]
        public string CodiceDealerConsumer { set; get; }

        [DataMember]
        public string IndirizzoDealerConsumer { set; get; }

        [DataMember]
        public string RagioneSocialeDealerConsumer { set; get; }

        [DataMember]
        public int IDTipoDealer { set; get; }

        [DataMember]
        public int IDDealer { set; get; }

        [DataMember]
        public string CodiceDealer { set; get; }

        [DataMember]
        public string IndirizzoDealer { set; get; }

        [DataMember]
        public string RagioneSocialeDealer { set; get; }
    }

    public class DealerBusiness
    {
        [DataMember]
        public int IDDealerBusiness { set; get; }

        [DataMember]
        public string Codice { set; get; }

        [DataMember]
        public string Nome { set; get; }

        [DataMember]
        public string Indirizzo { set; get; }
    }
    public class AutorizzazioneCampi
    {
        [DataMember]
        public int IDAutorizzazioneCampi { set; get; }

        [DataMember]
        public int Autorizzazione { set; get; }

        [DataMember]
        public int IDCampoDati { set; get; }

        [DataMember]
        public string NomeCampo { set; get; }

        [DataMember]
        public string NomeCampoFrontEnd { set; get; }

        [DataMember]
        public string NomeTabella { set; get; }

        [DataMember]
        public string TipoWebControl { set; get; }

        [DataMember]
        public string TipoDato { set; get; }

        [DataMember]
        public int LunghezzaMassima { set; get; }

        public Boolean Visibile { get { if (Autorizzazione > 1) { return true; } else { return false; } } }

        public Boolean SolaLettura { get { if (Autorizzazione == 2) { return true; } else { return false; } } }

        public Boolean ValidaControlli { get { if (ValidaEmail || ValidaData || ValidaNumero) { return true; } else { return false; } } }

        public Boolean ValidaEmail { get { if ((TipoDato == "Email") & SolaLettura == false) { return true; } else { return false; } } }

        public Boolean ValidaData { get { if ((TipoDato == "Data") & SolaLettura == false) { return true; } else { return false; } } }

        public Boolean ValidaNumero { get { if ((TipoDato == "Numero") & SolaLettura == false) { return true; } else { return false; } } }

        //public Boolean ValidaTelefono { get { if ((TipoDato == "NumeroTelefonico") & SolaLettura == false) { return true; } else { return false; } } }

    }

    public class DealerUpdateFields
    {
        [DataMember]
        public string NomeCampo { set; get; }
        [DataMember]
        public string DatoVecchio { set; get; }
        [DataMember]
        public string DatoNuovo { set; get; }

        public Boolean IsDatoModificato { get { if (DatoVecchio == DatoNuovo) { return false; } else { return true; } } }
    }

    public class DealerUpdate
    {
        public int IDDealer { set; get; }
        public List<DealerUpdateFields> DealerUpdateFieldsList { set; get; }
    }

    public class ExportFile
    {
        [DataMember]
        public int IDExportedFile { set; get; }
        [DataMember]
        public string FilePathScarti { set; get; }
        [DataMember]
        public string FileNameScarti { set; get; }
        [DataMember]
        public string FilePathAnomalie { set; get; }
        [DataMember]
        public string FileNameAnomalie { set; get; }
        [DataMember]
        public int FileType { set; get; }
        [DataMember]
        public DateTime DataExport { set; get; }
        [DataMember]
        public int IDImportazione { set; get; }

    }
}
