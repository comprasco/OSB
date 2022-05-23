xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://glass.aac.step.org/";
(:: import schema at "../Schemas/Legacy/ServicioConsultaEstadoJuridico.xsd_1.xsd" ::)
declare namespace ns1="http://www.gobiernoenlinea.gov.co/GEL-XML/1.0/schemas/integracion/supernotariado/bachue";
(:: import schema at "../Schemas/EE_DBM_consultarDatosBasicos.xsd" ::)

declare variable $payloadResponse as element() (:: schema-element(ns1:entradaDatosBasicos) ::) external;

declare function local:func($payloadResponse as element() (:: schema-element(ns1:entradaDatosBasicos) ::)) as element() (:: schema-element(ns2:consultaEstadoJuridico) ::) {
    <ns2:consultaEstadoJuridico>
        <objEntrada>
            <tipoCirculoRegistral>
                <departamentoCirculoRegistral>
                    <codDepartamento>{fn:data($payloadResponse/ns1:codDepartamento)}</codDepartamento>
                    <nomDepartamento></nomDepartamento>
                </departamentoCirculoRegistral>
                <jurisdiccionPredio></jurisdiccionPredio>
                <municipioCirculoRegistral>
                    <codMunicipio>{fn:data($payloadResponse/ns1:codMunicipio)}</codMunicipio>
                    <nomMunicipio></nomMunicipio>
                </municipioCirculoRegistral>
                <nombreJurisdiccionPredio></nombreJurisdiccionPredio>
            </tipoCirculoRegistral>
            <ubicacionMatriculaSistemaSNR>
                <CHIPPredio></CHIPPredio>
                <NITEntidad>
                    <digitoVerificador></digitoVerificador>
                    <numero></numero>
                </NITEntidad>
                <cedulaCatastralPredio></cedulaCatastralPredio>
                <direccionNacionalRuralUbicacionPredio>
                    <claseConcentracionPoblacionDireccionRural>
                        <codClaseConcentracionPoblacion></codClaseConcentracionPoblacion>
                        <nomClaseConcentracionPoblacion></nomClaseConcentracionPoblacion>
                    </claseConcentracionPoblacionDireccionRural>
                    <concentracionPoblacion>
                        <codConcentracionPoblacion></codConcentracionPoblacion>
                        <nomConcentracionPoblacion></nomConcentracionPoblacion>
                    </concentracionPoblacion>
                    <departamento>
                        <codDepartamento></codDepartamento>
                        <nomDepartamento></nomDepartamento>
                    </departamento>
                    <municipio>
                        <codMunicipio></codMunicipio>
                        <nomMunicipio></nomMunicipio>
                    </municipio>
                    <nomenclaturaDomiciliariaRural></nomenclaturaDomiciliariaRural>
                </direccionNacionalRuralUbicacionPredio>
                <direccionNacionalUrbanaUbicacionPredio>
                    <departamento>
                        <codDepartamento></codDepartamento>
                        <nomDepartamento></nomDepartamento>
                    </departamento>
                    <localidad>
                        <codLocalidad></codLocalidad>
                        <nomLocalidad></nomLocalidad>
                    </localidad>
                    <municipio>
                        <codMunicipio></codMunicipio>
                        <nomMunicipio></nomMunicipio>
                    </municipio>
                    <nomBarrio></nomBarrio>
                    <nomenclaturaDomiciliariaUrbana></nomenclaturaDomiciliariaUrbana>
                    <numeroDireccion></numeroDireccion>
                </direccionNacionalUrbanaUbicacionPredio>
                <estadoMatricula></estadoMatricula>
                <identificacionPersona>
                    <grupoNumeroIdentificacion>
                        <numCedulaExtranjeria></numCedulaExtranjeria>
                        <numIdAdultoSinIdentificar></numIdAdultoSinIdentificar>
                        <numIdMenorSinIdentificar></numIdMenorSinIdentificar>
                        <numIdentificacionRecienNacido></numIdentificacionRecienNacido>
                        <numRegistroCivil></numRegistroCivil>
                        <numTarjetaIdentidad></numTarjetaIdentidad>
                        <numeroCedulaCiudadania></numeroCedulaCiudadania>
                        <numeroCedulaExtranjero></numeroCedulaExtranjero>
                        <numeroPasaporte></numeroPasaporte>
                    </grupoNumeroIdentificacion>
                    <tipoIdNacionalPersona>
                        <codTipoIdentificacion></codTipoIdentificacion>
                        <nomTipoIdentificacion></nomTipoIdentificacion>
                    </tipoIdNacionalPersona>
                </identificacionPersona>
                <nomPersonaRelacionadoMatriculaInmobiliaria>
                    <primerApellido></primerApellido>
                    <primerNombre></primerNombre>
                    <segundoApellido></segundoApellido>
                    <segundoNombre></segundoNombre>
                </nomPersonaRelacionadoMatriculaInmobiliaria>
                <nombreEntidad></nombreEntidad>
                <numeroMatriculaInmobiliariaPredio></numeroMatriculaInmobiliariaPredio>
            </ubicacionMatriculaSistemaSNR>
        </objEntrada>
        <sistemaUsuario></sistemaUsuario>
        <clave></clave>
    </ns2:consultaEstadoJuridico>
};

local:func($payloadResponse)