xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/ee/cb/SBB_CB_HistoricoPropietarios/consultarHistoricoPropiedades/v1";
(:: import schema at "../Schemas/EE_HP_consultarHistoricoPropiedades.xsd" ::)
declare variable $codigo as xs:string external;
declare variable $mensaje as xs:string external;

declare function local:func($codigo as xs:string, $mensaje as xs:string) as element() (:: schema-element(ns1:salidaConsultarHistoricoPropiedades) ::) {
    <ns1:salidaConsultarHistoricoPropiedades>
        <ns1:propietarios>
            <ns1:historicoMatriculas>
                <ns1:numAnotacion></ns1:numAnotacion>
                <ns1:codCirculoRegistral></ns1:codCirculoRegistral>
                <ns1:porcentajeParticipacion></ns1:porcentajeParticipacion>
                <ns1:fechaDesde></ns1:fechaDesde>
                <ns1:fechaHasta></ns1:fechaHasta>
                <ns1:numMatriculaInmobiliaria></ns1:numMatriculaInmobiliaria>
                <ns1:NUPRE></ns1:NUPRE>
            </ns1:historicoMatriculas>
            <ns1:tipoDocumentoPersona></ns1:tipoDocumentoPersona>
            <ns1:numDocumentoPersona></ns1:numDocumentoPersona>
            <ns1:numNIT></ns1:numNIT>
            <ns1:primerApellido></ns1:primerApellido>
            <ns1:primerNombre></ns1:primerNombre>
            <ns1:segundoApellido></ns1:segundoApellido>
            <ns1:segundoNombre></ns1:segundoNombre>
            <ns1:razonSocial></ns1:razonSocial>
        </ns1:propietarios>
        <ns1:codMensaje>{fn:data($codigo)}</ns1:codMensaje>
        <ns1:descripcionMensaje>{fn:data($mensaje)}</ns1:descripcionMensaje>
    </ns1:salidaConsultarHistoricoPropiedades>
};


local:func($codigo,$mensaje)
