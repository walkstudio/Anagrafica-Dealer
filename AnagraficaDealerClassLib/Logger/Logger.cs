using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using NLog;

namespace AnagraficaDealerClassLib
{

    class AnagraficaDealerLogger
    {
        private Logger logger = LogManager.GetCurrentClassLogger();

        public void WriteLog(string LogText, NLog.LogLevel level)
        {
            switch (level.Name)
            { 
                case "Debug":
                    logger.Debug(LogText);
                    break;
                case "Info":
                    logger.Info(LogText);    
                    break;
                case "Warn":
                    logger.Warn(LogText);
                    break;
                case "Error":
                    logger.Error(LogText);
                    break;
            }
            
        }
        
    }
}
