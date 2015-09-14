using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ServiceModel;
using System.Data;

namespace AnagraficaDealerClassLib
{
    [ServiceContract]
    public interface IAnagraficaDealerService
    {
        [OperationContract]
        string InsertUser(Utente obj);

        [OperationContract]
        DataTable GetAllUsers();


        [OperationContract]
        bool DeleteUser(int UId);


        [OperationContract]
        bool UpdateUser(Utente obj);

    }


}
