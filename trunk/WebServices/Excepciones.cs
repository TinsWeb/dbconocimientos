using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace WebServices
{
    public class Excepciones
    {
    }

    public class carpetaInexistenteException : System.Exception
    {
        public carpetaInexistenteException()
        {
            
        }
        public carpetaInexistenteException(string message)
            : base(message)
        {
            
        }
        public carpetaInexistenteException(string message, Exception innerException)
            : base(message, innerException)
        {
            
        }
        protected carpetaInexistenteException(System.Runtime.Serialization.SerializationInfo info, System.Runtime.Serialization.StreamingContext context)
            : base(info, context)
        {
            
        }

    }

}