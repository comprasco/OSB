xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://ws.saimyr.com.co/";
(:: import schema at "../Schemas/Legacy/PazYSalvoWsService.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/schemas/bachue/ee/consultapazysalvotributario/consultarpazysalvotributario/v1";
(:: import schema at "../Schemas/EE_CPST_ConsultarPazySalvoTributario.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaConsultarPazySalvoTributario) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaConsultarPazySalvoTributario) ::)) as element() (:: schema-element(ns2:generarPysVur) ::) {
    <ns2:generarPysVur>
            <entidad>{fn:data($payloadRequest/ns1:entidad)}</entidad>
            <userEI>{fn:data($payloadRequest/ns1:usuario)}</userEI>
            <passwordEI>{fn:data($payloadRequest/ns1:clave)}</passwordEI>
            <codigoDpto>{fn:data($payloadRequest/ns1:codigoDepartamento)}</codigoDpto>
            <codigoMpio>{fn:data($payloadRequest/ns1:codigoMunicipio)}</codigoMpio>
            <codigoNotaria>{fn:data($payloadRequest/ns1:codigoNotaria)}</codigoNotaria>
            <ip>{fn:data($payloadRequest/ns1:ip)}</ip>
            <refCatastral>{fn:data($payloadRequest/ns1:referenciaCatastral)}</refCatastral>
            <idPers>{fn:data($payloadRequest/ns1:idpersona)}</idPers>
            <pdf>{fn:data($payloadRequest/ns1:pdf)}</pdf>
            
    </ns2:generarPysVur>
};

local:func($payloadRequest)
