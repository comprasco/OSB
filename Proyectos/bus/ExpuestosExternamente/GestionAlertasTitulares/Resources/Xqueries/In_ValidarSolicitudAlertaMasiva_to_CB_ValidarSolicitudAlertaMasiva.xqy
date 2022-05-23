xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/gestionalertastitulares/validarsolicitudalertamasiva/v1";
(:: import schema at "../Schemas/Legacy/CB_GAT_ValidarSolicitudAlertaMasiva.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/gestionalertastitulares/validarsolicitudalertamasiva/v1";
(:: import schema at "../Schemas/EE_GAT_ValidarSolicitudAlertaMasiva.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaValidarSolicitudAlertaMasiva) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaValidarSolicitudAlertaMasiva) ::)) as element() (:: schema-element(ns2:entradaValidarSolicitudAlertaMasiva) ::) {
    <ns2:entradaValidarSolicitudAlertaMasiva>
        <ns2:modulo>{fn:data($payloadRequest/ns1:modulo)}</ns2:modulo>
        <ns2:tipoDocumento>{fn:data($payloadRequest/ns1:tipoDocumento)}</ns2:tipoDocumento>
        <ns2:numeroDocumento>{fn:data($payloadRequest/ns1:numeroDocumento)}</ns2:numeroDocumento>
        {
            if ($payloadRequest/ns1:primerNombre)
            then <ns2:primerNombre>{fn:data($payloadRequest/ns1:primerNombre)}</ns2:primerNombre>
            else ()
        }
        {
            if ($payloadRequest/ns1:segundoNombre)
            then <ns2:segundoNombre>{fn:data($payloadRequest/ns1:segundoNombre)}</ns2:segundoNombre>
            else ()
        }
        {
            if ($payloadRequest/ns1:primerApellido)
            then <ns2:primerApellido>{fn:data($payloadRequest/ns1:primerApellido)}</ns2:primerApellido>
            else ()
        }
        {
            if ($payloadRequest/ns1:segundoApellido)
            then <ns2:segundoApellido>{fn:data($payloadRequest/ns1:segundoApellido)}</ns2:segundoApellido>
            else ()
        }
        {
            if ($payloadRequest/ns1:razonSocial)
            then <ns2:razonSocial>{fn:data($payloadRequest/ns1:razonSocial)}</ns2:razonSocial>
            else ()
        }
        {
            if ($payloadRequest/ns1:oripSecuencia)
            then <ns2:oripSecuencia>{fn:data($payloadRequest/ns1:oripSecuencia)}</ns2:oripSecuencia>
            else ()
        }
        {
            if ($payloadRequest/ns1:matriculaInicial)
            then <ns2:matriculaInicial>{fn:data($payloadRequest/ns1:matriculaInicial)}</ns2:matriculaInicial>
            else ()
        }
        {
            if ($payloadRequest/ns1:matriculaFinal)
            then <ns2:matriculaFinal>{fn:data($payloadRequest/ns1:matriculaFinal)}</ns2:matriculaFinal>
            else ()
        }
        {
            if ($payloadRequest/ns1:archivo)
            then <ns2:archivo>{fn:data($payloadRequest/ns1:archivo)}</ns2:archivo>
            else ()
        }
        
    </ns2:entradaValidarSolicitudAlertaMasiva>
};

local:func($payloadRequest)