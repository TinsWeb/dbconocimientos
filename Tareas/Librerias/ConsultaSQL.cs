using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

namespace Tareas.Librerias
{
    

    public class ConsultaSQL
    {
        

        /// <summary>
        /// Devuelve una consulta SQL UPDATE con un array de campos.
        /// </summary>
        /// <param name="_campos">
        /// Array string con nombres de los campos
        /// </param>
        /// <returns>
        /// String - Consulta SQL UPDATE SET
        /// </returns>
        public static string construirUpdate(ArrayList _campos)
        {
            System.Text.StringBuilder _tmp = new System.Text.StringBuilder();
            _tmp.Append("UPDATE Equipo SET ");

            var ASDASDA = _campos.Capacity;


            for (int i = 0; i < _campos.Count; i++)
            {
                if (i != _campos.Count - 1)
                {
                    _tmp.Append(String.Format("{0} = @{0}, ", _campos[i]));
                }
                else
                {
                    _tmp.Append(String.Format("{0} = @{0} ", _campos[i]));
                }
                    

            }
            
            _tmp.Append("WHERE id = @id");


            return _tmp.ToString();
       }
    }

    
}