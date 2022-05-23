xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/services/bachue/cb/SBB_CB_HistoricoPropietarios/consultarHistoricoPropiedades/v1";
(:: import schema at "../Schemas/Legacy/CB_HP_consultarHistoricoPropiedades.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/ee/cb/SBB_CB_HistoricoPropietarios/consultarHistoricoPropiedades/v1";
(:: import schema at "../Schemas/EE_HP_consultarHistoricoPropiedades.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultarHistoricoPropiedades) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultarHistoricoPropiedades) ::)) as element() (:: schema-element(ns2:entradaConsultarHistoricoPropiedades) ::) {
    <ns2:entradaConsultarHistoricoPropiedades>
        {
            if ($payloadRequest/ns1:tipoDocumentoPersona)
            then <ns2:tipoDocumentoPersona>{fn:data($payloadRequest/ns1:tipoDocumentoPersona)}</ns2:tipoDocumentoPersona>
            else ()
        }
        {
            if ($payloadRequest/ns1:numDocumentoPersona)
            then <ns2:numDocumentoPersona>{fn:data($payloadRequest/ns1:numDocumentoPersona)}</ns2:numDocumentoPersona>
            else ()
        }
        {
            if ($payloadRequest/ns1:numNIT)
            then <ns2:numNIT>{fn:data($payloadRequest/ns1:numNIT)}</ns2:numNIT>
            else ()
        }
        {
            if ($payloadRequest/ns1:primerApellido)
            then <ns2:primerApellido>{fn:data($payloadRequest/ns1:primerApellido)}</ns2:primerApellido>
            else ()
        }
        {
            if ($payloadRequest/ns1:primerNombre)
            then <ns2:primerNombre>{fn:data($payloadRequest/ns1:primerNombre)}</ns2:primerNombre>
            else ()
        }
        {
            if ($payloadRequest/ns1:segundoApellido)
            then <ns2:segundoApellido>{fn:data($payloadRequest/ns1:segundoApellido)}</ns2:segundoApellido>
            else ()
        }
        {
            if ($payloadRequest/ns1:segundoNombre)
            then <ns2:segundoNombre>{fn:data($payloadRequest/ns1:segundoNombre)}</ns2:segundoNombre>
            else ()
        }
        {
            if ($payloadRequest/ns1:razonSocial)
            then <ns2:razonSocial>{fn:data($payloadRequest/ns1:razonSocial)}</ns2:razonSocial>
            else ()
        }
        {
            if ($payloadRequest/ns1:convenio)
            then <ns2:convenio>{fn:data($payloadRequest/ns1:convenio)}</ns2:convenio>
            else ()
        }
    </ns2:entradaConsultarHistoricoPropiedades>
};

local:func($payloadRequest)
