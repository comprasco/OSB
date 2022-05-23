xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/operacionesfinancieras/generarliquidacion/v2";
(:: import schema at "../Schemas/Legacy/CB_OF_GenerarLiquidacion.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ef/operacionesfinancieras/generarliquidacion/v2";
(:: import schema at "../Schemas/EF_OF_GenerarLiquidacion.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaGenerarLiquidacion) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaGenerarLiquidacion) ::)) as element() (:: schema-element(ns2:entradaGenerarLiquidacion) ::) {
    <ns2:entradaGenerarLiquidacion>
        {
            if ($payloadRequest/ns1:codigoConvenio)
            then <ns2:codigoConvenio>{fn:data($payloadRequest/ns1:codigoConvenio)}</ns2:codigoConvenio>
            else ()
        }
        <ns2:codigoCanal>{fn:data($payloadRequest/ns1:codigoCanal)}</ns2:codigoCanal>
        <ns2:codigoSucursalCanal>{fn:data($payloadRequest/ns1:codigoSucursalCanal)}</ns2:codigoSucursalCanal>
        {
            if ($payloadRequest/ns1:oripSolicitud)
            then <ns2:oripSolicitud>{fn:data($payloadRequest/ns1:oripSolicitud)}</ns2:oripSolicitud>
            else ()
        }
        <ns2:tipoPersona>{fn:data($payloadRequest/ns1:tipoPersona)}</ns2:tipoPersona>
        <ns2:tipoDocSolicitante>{fn:data($payloadRequest/ns1:tipoDocSolicitante)}</ns2:tipoDocSolicitante>
        <ns2:numeroDocSolicitante>{fn:data($payloadRequest/ns1:numeroDocSolicitante)}</ns2:numeroDocSolicitante>
        {
            if ($payloadRequest/ns1:primerNombreSolicitante)
            then <ns2:primerNombreSolicitante>{fn:data($payloadRequest/ns1:primerNombreSolicitante)}</ns2:primerNombreSolicitante>
            else ()
        }
        {
            if ($payloadRequest/ns1:segundoNombreSolicitante)
            then <ns2:segundoNombreSolicitante>{fn:data($payloadRequest/ns1:segundoNombreSolicitante)}</ns2:segundoNombreSolicitante>
            else ()
        }
        {
            if ($payloadRequest/ns1:primerApellidoSolicitante)
            then <ns2:primerApellidoSolicitante>{fn:data($payloadRequest/ns1:primerApellidoSolicitante)}</ns2:primerApellidoSolicitante>
            else ()
        }
        {
            if ($payloadRequest/ns1:segundoApellidoSolicitante)
            then <ns2:segundoApellidoSolicitante>{fn:data($payloadRequest/ns1:segundoApellidoSolicitante)}</ns2:segundoApellidoSolicitante>
            else ()
        }
        {
            if ($payloadRequest/ns1:razonSocial)
            then <ns2:razonSocial>{fn:data($payloadRequest/ns1:razonSocial)}</ns2:razonSocial>
            else ()
        }
        <ns2:servicios>
            {
                for $servicio in $payloadRequest/ns1:servicios/ns1:servicio
                return 
                <ns2:servicio>
                    <ns2:tipoServicio>{fn:data($servicio/ns1:tipoServicio)}</ns2:tipoServicio>
                    <ns2:subtipoServicio>{fn:data($servicio/ns1:subtipoServicio)}</ns2:subtipoServicio>
                    <ns2:cantidadSolicitada>{fn:data($servicio/ns1:cantidadSolicitada)}</ns2:cantidadSolicitada>
                    <ns2:valorServicio>{fn:data($servicio/ns1:valorServicio)}</ns2:valorServicio>
                    <ns2:criterios>
                        {
                            for $criterio in $servicio/ns1:criterios/ns1:criterio
                            return 
                            <ns2:criterio>
                                <ns2:codigo>{fn:data($criterio/ns1:codigo)}</ns2:codigo>
                                <ns2:valor>{fn:data($criterio/ns1:valor)}</ns2:valor></ns2:criterio>
                        }
                    </ns2:criterios></ns2:servicio>
            }
        </ns2:servicios>
        
       
    </ns2:entradaGenerarLiquidacion>
};

local:func($payloadRequest)