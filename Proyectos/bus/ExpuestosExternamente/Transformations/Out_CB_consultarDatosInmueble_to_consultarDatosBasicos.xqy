xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.gobiernoenlinea.gov.co/GEL-XML/1.0/schemas/integracion/supernotariado/bachue";
(:: import schema at "../DatosBasicosMatricula/Resources/Schemas/EE_DBM_consultarDatosBasicos.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/cb/inmuebles/consultarDatosImueble/v1";
(:: import schema at "../DatosBasicosMatricula/Resources/Schemas/Legacy/CB_I_consultarDatosInmueble.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaDatosInmueble) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaDatosInmueble) ::)) as element() (:: schema-element(ns2:salidaDatosBasicos) ::) {
    <ns2:salidaDatosBasicos>
        <ns2:cantidadMatriculas>
        </ns2:cantidadMatriculas>
        <ns2:estadoMatricula></ns2:estadoMatricula>
        <ns2:matriculas>
            <ns2:estadoMatricula></ns2:estadoMatricula>
            <ns2:numMatriculaInmobiliaria></ns2:numMatriculaInmobiliaria>
            <ns2:codCirculoRegistral></ns2:codCirculoRegistral>
            <ns2:nomCirculoRegistral></ns2:nomCirculoRegistral>
            <ns2:numPredial></ns2:numPredial>
            <ns2:estadoNUPRE></ns2:estadoNUPRE>
            <ns2:NUPRE></ns2:NUPRE>
            <ns2:direccionPredio></ns2:direccionPredio>
            <ns2:codDepartamento></ns2:codDepartamento>
            <ns2:nomDepartamento></ns2:nomDepartamento>
            <ns2:codMunicipio></ns2:codMunicipio>
            <ns2:nomMunicipio></ns2:nomMunicipio>
            <ns2:tipoPredio></ns2:tipoPredio>
            <ns2:propietarios>
                <ns2:tipoDocumentoPersona></ns2:tipoDocumentoPersona>
                <ns2:numDocumentoPersona></ns2:numDocumentoPersona>
                <ns2:numNIT></ns2:numNIT>
                <ns2:primerApellido></ns2:primerApellido>
                <ns2:segundoApellido></ns2:segundoApellido>
                <ns2:primerNombre></ns2:primerNombre>
                <ns2:segundoNombre></ns2:segundoNombre>
                <ns2:razonSocial></ns2:razonSocial>
                <ns2:porcentajeParticipacion></ns2:porcentajeParticipacion>
            </ns2:propietarios>
        </ns2:matriculas>
        <ns2:fechaHoraConsulta></ns2:fechaHoraConsulta>
        <ns2:numeroConsulta></ns2:numeroConsulta>
        <ns2:codMensaje></ns2:codMensaje>
        <ns2:descripcionMensaje></ns2:descripcionMensaje>
    </ns2:salidaDatosBasicos>
};

local:func($payloadResponse)
