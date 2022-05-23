xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/gestionalertastitulares/inactivaralerta/v1";
(:: import schema at "../Schemas/Legacy/CB_GAT_InactivarAlerta.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/gestionalertastitulares/inactivaralerta/v1";
(:: import schema at "../Schemas/EE_GAT_InactivarAlerta.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaInactivarAlerta) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaInactivarAlerta) ::)) as element() (:: schema-element(ns2:salidaInactivarAlerta) ::) {
    <ns2:salidaInactivarAlerta>
        <ns2:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/ns1:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
        
    </ns2:salidaInactivarAlerta>
};

local:func($payloadResponse)