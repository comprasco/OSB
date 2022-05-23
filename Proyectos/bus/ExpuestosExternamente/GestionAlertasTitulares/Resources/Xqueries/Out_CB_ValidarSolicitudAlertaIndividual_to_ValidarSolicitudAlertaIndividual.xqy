xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/gestionalertastitulares/validarsolicitudalertaindividual/v1";
(:: import schema at "../Schemas/Legacy/CB_GAT_ValidarSolicitudAlertaIndividual.xsd" ::)
declare namespace v1="https://www.supernotariado.gov.co/schemas/bachue/ee/gestionalertastitulares/validarsolicitudalertaindividual/v1";
(:: import schema at "../Schemas/EE_GAT_ValidarSolicitudAlertaIndividual.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaValidarSolicitudAlertaIndividual) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaValidarSolicitudAlertaIndividual) ::)) as element() (:: schema-element(v1:salidaValidarSolicitudAlertaIndividual) ::) {
    <v1:salidaValidarSolicitudAlertaIndividual>
        <v1:departamento>{fn:data($payloadResponse/ns1:departamento)}</v1:departamento>
        <v1:ciudad>{fn:data($payloadResponse/ns1:ciudad)}</v1:ciudad>
        <v1:direccion>{fn:data($payloadResponse/ns1:direccion)}</v1:direccion>
        <v1:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</v1:codigoMensaje>
        {
            if ($payloadResponse/ns1:descripcionMensaje)
            then <v1:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</v1:descripcionMensaje>
            else ()
        }
        
    </v1:salidaValidarSolicitudAlertaIndividual>
};

local:func($payloadResponse)