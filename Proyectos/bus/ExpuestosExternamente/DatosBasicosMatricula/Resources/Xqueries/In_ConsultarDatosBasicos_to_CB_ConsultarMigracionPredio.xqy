xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.gobiernoenlinea.gov.co/GEL-XML/1.0/schemas/integracion/supernotariado/bachue";
(:: import schema at "../Schemas/EE_DBM_consultarDatosBasicos.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/services/bachue/cb/consultamigracion/consultarMigracionPredio/v1";
(:: import schema at "../../../ConsultaMigracion/Resources/Schemas/Legacy/CB_CM_consultarMigracionPredio.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaDatosBasicos) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaDatosBasicos) ::)) as element() (:: schema-element(ns2:entradaConsultaMigracionPredio) ::) {
    <ns2:entradaConsultaMigracionPredio>
          {
                if ($payloadRequest/ns1:criterioBusqueda/text()='numPredial')
                then <ns2:tipoIdentificacionPredio>numeroPredial</ns2:tipoIdentificacionPredio>
                else (if ($payloadRequest/ns1:criterioBusqueda/text()='numPredialAnterior')
                      then <ns2:tipoIdentificacionPredio>numeroPredialAnterior</ns2:tipoIdentificacionPredio>
                      else (<ns2:tipoIdentificacionPredio>{fn:data($payloadRequest/ns1:criterioBusqueda)}</ns2:tipoIdentificacionPredio>)
                      )
          }
        
        <ns2:numIdentificacionPredio>{fn:data($payloadRequest/ns1:valorCriterioBusqueda)}</ns2:numIdentificacionPredio>
    </ns2:entradaConsultaMigracionPredio>
};

local:func($payloadRequest)