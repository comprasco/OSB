xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/gestionalertastitulares/actualizarcontactoalerta/v1";
(:: import schema at "../Schemas/Legacy/CB_GAT_ActualizarContactoAlerta.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/gestionalertastitulares/actualizarcontactoalerta/v1";
(:: import schema at "../Schemas/EE_GAT_ActualizarContactoAlerta.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaActualizarContactoAlerta) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaActualizarContactoAlerta) ::)) as element() (:: schema-element(ns2:salidaActualizarContactoAlerta) ::) {
    <ns2:salidaActualizarContactoAlerta>
        <ns2:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/ns1:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
        
    </ns2:salidaActualizarContactoAlerta>
};

local:func($payloadResponse)