xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/co/busquedadocumentos/obtenerarchivo/v1";
(:: import schema at "../../../../ConsumidosInternamente/BusquedaDocumentos/Resources/Schemas/Legacy/CO_BD_ObtenerArchivo.xsd" ::)
declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/ef/operacionesfinancieras/obtenerpdfliquidacion/v2";
(:: import schema at "../Schemas/EF_OF_ObtenerPDFLiquidacion.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaObtenerArchivo) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaObtenerArchivo) ::)) as element() (:: schema-element(ns2:salidaObtenerPDFLiquidacion) ::) {
   <ns2:salidaObtenerPDFLiquidacion>
        <ns2:documentoSerializado>{fn:data($payloadResponse/*:archivo)}</ns2:documentoSerializado>
        <ns2:codigoMensaje>{fn:data($payloadResponse/*:codigoMensaje)}</ns2:codigoMensaje>
        {
            if ($payloadResponse/*:descripcionMensaje)
            then <ns2:descripcionMensaje>{fn:data($payloadResponse/*:descripcionMensaje)}</ns2:descripcionMensaje>
            else ()
        }
        
    </ns2:salidaObtenerPDFLiquidacion>
};

local:func($payloadResponse)
