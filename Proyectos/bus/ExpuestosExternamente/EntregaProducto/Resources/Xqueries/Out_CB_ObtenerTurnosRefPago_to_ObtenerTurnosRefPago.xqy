xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/cb/entregaproducto/obtenerturnosrefpago/v1";
(:: import schema at "../Schemas/Legacy/CB_EP_ObtenerTurnosRefPago.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ee/entregaproducto/obtenerturnosrefpago/v1";
(:: import schema at "../Schemas/EE_EP_ObtenerTurnosRefPago.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaObtenerTurnosRefPago) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaObtenerTurnosRefPago) ::)) as element() (:: schema-element(ns2:salidaObtenerTurnosRefPago) ::) {
    <ns2:salidaObtenerTurnosRefPago>
        <ns2:turnos>
            <ns2:turno>
                <ns2:identificadorTurno>{fn:data($payloadResponse/ns1:turnos/ns1:turno/ns1:identificadorTurno)}</ns2:identificadorTurno>
            </ns2:turno>
        </ns2:turnos>
        <ns2:codigoMensaje>{fn:data($payloadResponse/ns1:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/ns1:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
    </ns2:salidaObtenerTurnosRefPago>
};

local:func($payloadResponse)
