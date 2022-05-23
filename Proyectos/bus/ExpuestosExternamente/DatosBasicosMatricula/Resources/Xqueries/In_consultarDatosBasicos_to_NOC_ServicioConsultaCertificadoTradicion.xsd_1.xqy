xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)
declare namespace dvm="http://www.oracle.com/osb/xpath-functions/dvm";
declare namespace ns2="http://glass.aac.step.org/";
(:: import schema at "../Schemas/Legacy/ServicioConsultaCertificadoTradicion.xsd_1.xsd" ::)
declare namespace ns1="http://www.gobiernoenlinea.gov.co/GEL-XML/1.0/schemas/integracion/supernotariado/bachue";
(:: import schema at "../Schemas/EE_DBM_consultarDatosBasicos.xsd" ::)

declare variable $payloadRequest as element() (:: schema-element(ns1:entradaDatosBasicos) ::) external;

declare function local:func($payloadRequest as element() (:: schema-element(ns1:entradaDatosBasicos) ::)) as element() (:: schema-element(ns2:ejecutar) ::) {
    <ns2:ejecutar>
        <entrada>
            <numeroDirecciones></numeroDirecciones>
            <numeroPropietarios></numeroPropietarios>
            <tipoCirculoRegistral>
                <departamentoCirculoRegistral>
                    <codDepartamento>{fn:data($payloadRequest/ns1:codDepartamento)}</codDepartamento>
                    <nomDepartamento></nomDepartamento>
                </departamentoCirculoRegistral>
                <jurisdiccionPredio></jurisdiccionPredio>
                <municipioCirculoRegistral>
                    <codMunicipio>{fn:data($payloadRequest/ns1:codMunicipio)}</codMunicipio>
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
                        <codDepartamento>{fn:data($payloadRequest/ns1:codDepartamento)}</codDepartamento>
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
        </entrada>
        <sistemaUsuario>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'User', 'Valor', ''))}</sistemaUsuario>
        <clave>{fn:string(dvm:lookup('ExpuestosExternamente/LoginNOC/DVM/Login_NOC', 'Llave', 'Password', 'Valor', ''))}
</clave>
    </ns2:ejecutar>
};

local:func($payloadRequest)