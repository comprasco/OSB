xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/consultatrazabilidad/consultaActosTurno/v1";
(:: import schema at "../Schemas/Legacy/CB_CT_ConsultaActosTurno.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/consultatrazabilidad/consultaActosTurno/v1";
(:: import schema at "../Schemas/EE_CT_ConsultaActosTurno.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultaActosTurno) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultaActosTurno) ::)) as element() (:: schema-element(ns2:entradaConsultaActosTurno) ::) {
    <ns2:entradaConsultaActosTurno>
        {
            if ($payloadRequest/ns1:modulo)
            then <ns2:modulo>{fn:data($payloadRequest/ns1:modulo)}</ns2:modulo>
            else ()
        }
        {
            if ($payloadRequest/ns1:criterioBusqueda)
            then <ns2:criterioBusqueda>{fn:data($payloadRequest/ns1:criterioBusqueda)}</ns2:criterioBusqueda>
            else ()
        }
        {
            if ($payloadRequest/ns1:valorCriterioBusqueda)
            then <ns2:valorCriterioBusqueda>{fn:data($payloadRequest/ns1:valorCriterioBusqueda)}</ns2:valorCriterioBusqueda>
            else ()
        }
    </ns2:entradaConsultaActosTurno>
};

local:func($payloadRequest)
