xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace v1="https://www.supernotariado.gov.co/schemas/bachue/cb/consultadatosregistrales/consultardatosregistrales/v1";
(:: import schema at "../Schemas/Legacy/CB_CDR_ConsultarDatosRegistrales.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ci/consultadatosregistrales/consultardatosregistrales/v1";
(:: import schema at "../Schemas/CI_CDR_ConsultarDatosRegistrales.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultarDatosRegistrales) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultarDatosRegistrales) ::)) as element() (:: schema-element(v1:entradaConsultarDatosRegistrales) ::) {
    <v1:entradaConsultarDatosRegistrales>
        <v1:modulo>{fn:data($payloadRequest/ns1:modulo)}</v1:modulo>
        <v1:criterioBusqueda>{fn:data($payloadRequest/ns1:criterioBusqueda)}</v1:criterioBusqueda>
        <v1:valorCriterioBusqueda>{fn:data($payloadRequest/ns1:valorCriterioBusqueda)}</v1:valorCriterioBusqueda>
    </v1:entradaConsultarDatosRegistrales>
};

local:func($payloadRequest)