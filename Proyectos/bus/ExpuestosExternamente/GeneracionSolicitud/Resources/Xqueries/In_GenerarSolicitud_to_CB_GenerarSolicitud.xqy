xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="https://www.supernotariado.gov.co/schemas/bachue/cb/generacionsolicitud/generarsolicitud/v1";
(:: import schema at "../WSDLs/BS_SBB_CB_GeneracionSolicitud.wsdl" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/generacionsolicitud/generarsolicitud/v1";
(:: import schema at "../Schemas/EE_GS_GenerarSolicitud.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaGenerarSolicitud) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaGenerarSolicitud) ::)) as element() (:: schema-element(ns2:entradaGenerarSolicitud) ::) {
    <ns2:entradaGenerarSolicitud>
        <ns2:modulo>{fn:data($payloadRequest/ns1:modulo)}</ns2:modulo>
        <ns2:solicitante>
            <ns2:tipoDocumento>{fn:data($payloadRequest/ns1:solicitante/ns1:tipoDocumento)}</ns2:tipoDocumento>
            <ns2:numeroDocumento>{fn:data($payloadRequest/ns1:solicitante/ns1:numeroDocumento)}</ns2:numeroDocumento>
            <ns2:tipoPersona>{fn:data($payloadRequest/ns1:solicitante/ns1:tipoPersona)}</ns2:tipoPersona></ns2:solicitante>
        <ns2:servicios>
            {
                for $servicio in $payloadRequest/ns1:servicios/ns1:servicio
                return 
                <ns2:servicio>
                    <ns2:tipoServicio>{fn:data($servicio/ns1:tipoServicio)}</ns2:tipoServicio>
                    <ns2:subtipoServicio>{fn:data($servicio/ns1:subtipoServicio)}</ns2:subtipoServicio>
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
    </ns2:entradaGenerarSolicitud>
};

local:func($payloadRequest)
