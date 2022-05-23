xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/EE/NA/v1";
(:: import schema at "../Schemas/EE_NombresYApellidos.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/EE/v1";
(:: import schema at "../Schemas/Legacy/NombresYApellidos.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:Root) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:Root) ::)) as element() (:: schema-element(ns2:Root) ::) {
    <ns2:Root>
        <ns2:primerApellido>{fn:data($payloadRequest/ns1:primerApellido)}</ns2:primerApellido>
        <ns2:primerNombre>{fn:data($payloadRequest/ns1:primerNombre)}</ns2:primerNombre>
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
    </ns2:Root>
};

local:func($payloadRequest)
