xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.gobiernoenlinea.gov.co/GEL-XML/1.0/schemas/integracion/supernotariado/bachue";
(:: import schema at "../Schemas/EE_DBM_consultarDatosBasicos.xsd" ::)
declare namespace ns1="https://www.supernotariado.gov.co/services/bachue/cb/inmuebles/consultarDatosBasicos/v1";
(:: import schema at "../Schemas/Legacy/CB_I_consultarDatosBasicos.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:salidaDatosBasicos) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:salidaDatosBasicos) ::)) as element() (:: schema-element(ns2:salidaDatosBasicos) ::) {
    <ns2:salidaDatosBasicos>
        <ns2:cantidadMatriculas>{fn:data($payloadResponse/ns1:cantidadMatriculas)}</ns2:cantidadMatriculas>
        <ns2:estadoMatricula></ns2:estadoMatricula>
        {
            for $matriculas in $payloadResponse/ns1:matriculas
            return 
            <ns2:matriculas>
                <ns2:estadoMatricula>{fn:data($matriculas/ns1:estadoMatricula)}</ns2:estadoMatricula>
                <ns2:numMatriculaInmobiliaria>{fn:data($matriculas/ns1:numMatriculaInmobiliaria)}</ns2:numMatriculaInmobiliaria>
                <ns2:codCirculoRegistral>{fn:data($matriculas/ns1:codCirculoRegistral)}</ns2:codCirculoRegistral>
                <ns2:nomCirculoRegistral>{fn:data($matriculas/ns1:nomCirculoRegistral)}</ns2:nomCirculoRegistral>
                <ns2:numPredial>{fn:data($matriculas/ns1:numPredial)}</ns2:numPredial>
                <ns2:estadoNUPRE>{fn:data($matriculas/ns1:estadoNUPRE)}</ns2:estadoNUPRE>
                <ns2:NUPRE>{fn:data($matriculas/ns1:NUPRE)}</ns2:NUPRE>
                <ns2:direccionPredio>{fn:data($matriculas/ns1:direccionPredio)}</ns2:direccionPredio>
                <ns2:codDepartamento>{fn:data($matriculas/ns1:codDepartamento)}</ns2:codDepartamento>
                <ns2:nomDepartamento>{fn:data($matriculas/ns1:nomDepartamento)}</ns2:nomDepartamento>
                <ns2:codMunicipio>{fn:data($matriculas/ns1:codMunicipio)}</ns2:codMunicipio>
                <ns2:nomMunicipio>{fn:data($matriculas/ns1:nomMunicipio)}</ns2:nomMunicipio>
                <ns2:tipoPredio>{fn:data($matriculas/ns1:tipoPredio)}</ns2:tipoPredio>
                {
                    for $propietarios in $matriculas/ns1:propietarios
                    return 
                    <ns2:propietarios>
                        <ns2:tipoDocumentoPersona>{fn:data($propietarios/ns1:tipoDocumentoPersona)}</ns2:tipoDocumentoPersona>
                        <ns2:numDocumentoPersona>{fn:data($propietarios/ns1:numDocumentoPersona)}</ns2:numDocumentoPersona>
                        <ns2:numNIT>{fn:data($propietarios/ns1:numNIT)}</ns2:numNIT>
                        <ns2:primerApellido>{fn:data($propietarios/ns1:primerApellido)}</ns2:primerApellido>
                        <ns2:segundoApellido>{fn:data($propietarios/ns1:segundoApellido)}</ns2:segundoApellido>
                        <ns2:primerNombre>{fn:data($propietarios/ns1:primerNombre)}</ns2:primerNombre>
                        <ns2:segundoNombre>{fn:data($propietarios/ns1:segundoNombre)}</ns2:segundoNombre>
                        <ns2:razonSocial>{fn:data($propietarios/ns1:razonSocial)}</ns2:razonSocial>
                        <ns2:porcentajeParticipacion>{fn:data($propietarios/ns1:porcentajeParticipacion)}</ns2:porcentajeParticipacion></ns2:propietarios>
                }</ns2:matriculas>
        }
        <ns2:fechaHoraConsulta></ns2:fechaHoraConsulta>
        <ns2:numeroConsulta></ns2:numeroConsulta>
        <ns2:codMensaje>{fn:data($payloadResponse/ns1:codMensaje)}</ns2:codMensaje>
        <ns2:descripcionMensaje>{fn:data($payloadResponse/ns1:descripcionMensaje)}</ns2:descripcionMensaje>
    </ns2:salidaDatosBasicos>
};

local:func($payloadResponse)