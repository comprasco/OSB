xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.gobiernoenlinea.gov.co/GEL-XML/1.0/schemas/integracion/supernotariado/bachue";
(:: import schema at "../Schemas/EE_EJF_consultarEstadoJuridico.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/services/bachue/cb/matriculasrelacionadas/consultarMatriculasDerivadas/v1";
(:: import schema at "../Schemas/Legacy/CB_MR_consultarMatriculasDerivadas.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:consultaEstadoJuridicaSolicitud) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:consultaEstadoJuridicaSolicitud) ::)) as element() (:: schema-element(ns2:entradaDatosMatriculasDerivadas) ::) {
    <ns2:entradaDatosMatriculasDerivadas>
        <ns2:tipoIdentificacionPredio>{fn:data($payloadRequest/ns1:tipoIdentificacionPredio)}</ns2:tipoIdentificacionPredio>
        <ns2:numIdentificacionPredio>{fn:data($payloadRequest/ns1:numIdentificacionPredio)}</ns2:numIdentificacionPredio>
    </ns2:entradaDatosMatriculasDerivadas>
};

local:func($payloadRequest)
