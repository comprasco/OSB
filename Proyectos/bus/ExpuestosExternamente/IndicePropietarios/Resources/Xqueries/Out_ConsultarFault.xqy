xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/ee/indicepropietarios/consultar/v1";
(:: import schema at "../Schemas/EE_IP_consultar.xsd" ::)
declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;


declare function local:func($codigo as xs:string, $mensaje as xs:string) as element()  (:: schema-element(ns1:salidaIndicePropietarios)::) {
    <ns1:salidaIndicePropietarios>
        <ns1:cantidadResultados></ns1:cantidadResultados>
        <ns1:datosInmueble>
                <ns1:codCirculoRegistral></ns1:codCirculoRegistral>
                <ns1:codDepartamento></ns1:codDepartamento>
                <ns1:codMunicipio></ns1:codMunicipio>
                <ns1:direccionPredio></ns1:direccionPredio>
                <ns1:numMatriculaInmobiliaria></ns1:numMatriculaInmobiliaria>
                <ns1:numPredial></ns1:numPredial>
                <ns1:NUPRE></ns1:NUPRE>
                <ns1:nomCirculoRegistral></ns1:nomCirculoRegistral>
                <ns1:nomDepartamento></ns1:nomDepartamento>
                <ns1:nomMunicipio></ns1:nomMunicipio>
                <ns1:propietarios>
                    <ns1:numNIT></ns1:numNIT>
                    <ns1:numDocumentoPersona></ns1:numDocumentoPersona>
                    <ns1:nomTipoDocumento></ns1:nomTipoDocumento>
                    <ns1:nomPropietario></ns1:nomPropietario>
                </ns1:propietarios>
        </ns1:datosInmueble>
        <ns1:fechaHoraConsulta></ns1:fechaHoraConsulta>
        <ns1:codMensaje>{fn:data($codigo)}</ns1:codMensaje>
        <ns1:descripcionMensaje>{fn:data($mensaje)}</ns1:descripcionMensaje>
    </ns1:salidaIndicePropietarios>
};

local:func($codigo,$mensaje)
