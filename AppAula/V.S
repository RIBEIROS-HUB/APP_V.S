// App.js
import React, { useState } from "react";
import {
  View,
  Text,
  FlatList,
  TouchableOpacity,
  Image,
  StyleSheet,
  ScrollView,
} from "react-native";

const categorias = {
  "Body Splash": [
    {
      id: "1",
      nome: "Bombshell",
      imagem: "",
      descricao:
        "O Bombshell é o body splash icônico da Victoria’s Secret, com notas frutadas e florais, transmitindo confiança e poder.",
    },
    {
      id: "2",
      nome: "Love Spell",
      imagem: "",
      descricao:
        "Notas de pêssego e flor de cerejeira. Refrescante e envolvente, perfeito para o dia a dia.",
    },
    {
      id: "3",
      nome: "Bare Vanilla",
      imagem: "bare.png",
      descricao:
        "Uma fragrância doce e aconchegante, com notas de baunilha cremosa e âmbar, trazendo sensação de conforto e sofisticação.",
    },
    {
      id: "4",
      nome: "Coconut Passion",
      imagem: "",
      descricao:
        "Fragrância leve com coco e baunilha, trazendo frescor tropical e suavidade irresistível.",
    },
  ],
  "Body Lotion": [
    {
      id: "5",
      nome: "Pure Seduction",
      imagem: "",
      descricao:
        "Hidratante corporal intenso com fragrância de ameixa vermelha e frésia.",
    },
    {
      id: "6",
      nome: "Velvet Petals",
      imagem: "",
      descricao:
        "Hidratante floral adocicado, suave e elegante, perfeito para uso diário.",
    },
  ],
  Pijamas: [
    {
      id: "7",
      nome: "Pijama Seda Rosa",
      imagem: "",
      descricao:
        "Pijama em seda rosa, leve e sofisticado, ideal para noites confortáveis e estilosas.",
    },
    {
      id: "8",
      nome: "Pijama Estampa Floral",
      imagem: "",
      descricao:
        "Pijama de algodão com estampa floral delicada, transmitindo frescor e feminilidade.",
    },
  ],
  Calcinhas: [
    {
      id: "9",
      nome: "Calcinha Rendada Dream Angels",
      imagem: "",
      descricao:
        "Calcinha com renda delicada, sensual e confortável, parte da linha Dream Angels.",
    },
    {
      id: "10",
      nome: "Calcinha Cotton Comfort",
      imagem: "",
      descricao:
        "Feita em algodão macio, perfeita para o dia a dia, unindo conforto e estilo.",
    },
  ],
};

export default function App() {
  const [categoriaAtiva, setCategoriaAtiva] = useState("Body Splash");
  const [selecionado, setSelecionado] = useState(null);

  return (
    <ScrollView style={styles.container}>
      <Text style={styles.titulo}>História da Victoria’s Secret</Text>
      <Text style={styles.texto}>
        A Victoria’s Secret foi fundada em 1977, tornando-se rapidamente um
        ícone mundial de lingerie, fragrâncias e moda feminina. Reconhecida por
        seus desfiles glamourosos e produtos marcantes, a marca representa
        sensualidade e confiança.
      </Text>
      <Text style={styles.texto}>
        Hoje, a Victoria’s Secret também se conecta com tecnologia e inovação.
        Ferramentas criativas como o DALL·E inspiram novas formas de imaginar
        campanhas e coleções, combinando arte, moda e inteligência artificial.
      </Text>

      {/* Abas de categorias */}
      <View style={styles.abas}>
        {Object.keys(categorias).map((cat) => (
          <TouchableOpacity
            key={cat}
            style={[
              styles.aba,
              categoriaAtiva === cat && styles.abaAtiva,
            ]}
            onPress={() => {
              setCategoriaAtiva(cat);
              setSelecionado(null);
            }}
          >
            <Text
              style={[
                styles.textoAba,
                categoriaAtiva === cat && styles.textoAbaAtiva,
              ]}
            >
              {cat}
            </Text>
          </TouchableOpacity>
        ))}
      </View>

      {/* Lista de produtos */}
      <FlatList
        data={categorias[categoriaAtiva]}
        keyExtractor={(item) => item.id}
        renderItem={({ item }) => (
          <TouchableOpacity
            style={styles.card}
            onPress={() => setSelecionado(item)}
          >
            {item.imagem ? (
              <Image source={{ uri: item.imagem }} style={styles.imagem} />
            ) : (
              <View style={styles.imagemPlaceholder}>
                <Text style={{ color: "#999" }}>Imagem</Text>
              </View>
            )}
            <Text style={styles.nome}>{item.nome}</Text>
          </TouchableOpacity>
        )}
      />

      {/* Detalhes do produto */}
      {selecionado && (
        <View style={styles.detalhes}>
          {selecionado.imagem ? (
            <Image source={{ uri: selecionado.imagem }} style={styles.imgDetalhe} />
          ) : (
            <View style={styles.imgDetalhePlaceholder}>
              <Text style={{ color: "#999" }}>Imagem</Text>
            </View>
          )}
          <Text style={styles.detalheTitulo}>{selecionado.nome}</Text>
          <Text style={styles.detalheTexto}>{selecionado.descricao}</Text>
        </View>
      )}
    </ScrollView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 15,
    backgroundColor: "#fff0f6",
  },
  titulo: {
    fontSize: 22,
    fontWeight: "bold",
    marginBottom: 10,
    color: "#c2185b",
  },
  texto: {
    fontSize: 15,
    lineHeight: 22,
    marginBottom: 10,
    color: "#4a148c",
  },
  abas: {
    flexDirection: "row",
    justifyContent: "space-around",
    marginVertical: 15,
    flexWrap: "wrap",
  },
  aba: {
    paddingVertical: 8,
    paddingHorizontal: 15,
    borderRadius: 20,
    backgroundColor: "#f8bbd0",
    margin: 5,
  },
  abaAtiva: {
    backgroundColor: "#c2185b",
  },
  textoAba: {
    fontSize: 14,
    color: "#880e4f",
    fontWeight: "bold",
  },
  textoAbaAtiva: {
    color: "#fff",
  },
  card: {
    flexDirection: "row",
    alignItems: "center",
    backgroundColor: "#ffe6f0",
    borderRadius: 12,
    padding: 10,
    marginBottom: 12,
    elevation: 2,
  },
  imagem: {
    width: 80,
    height: 100,
    borderRadius: 8,
    marginRight: 10,
  },
  imagemPlaceholder: {
    width: 80,
    height: 100,
    borderRadius: 8,
    marginRight: 10,
    backgroundColor: "#eee",
    justifyContent: "center",
    alignItems: "center",
  },
  nome: {
    fontSize: 16,
    fontWeight: "bold",
    color: "#ad1457",
  },
  detalhes: {
    marginTop: 20,
    padding: 15,
    backgroundColor: "#fff",
    borderRadius: 12,
    elevation: 3,
  },
  imgDetalhe: {
    width: "100%",
    height: 250,
    borderRadius: 12,
    marginBottom: 10,
  },
  imgDetalhePlaceholder: {
    width: "100%",
    height: 250,
    borderRadius: 12,
    marginBottom: 10,
    backgroundColor: "#eee",
    justifyContent: "center",
    alignItems: "center",
  },
  detalheTitulo: {
    fontSize: 20,
    fontWeight: "bold",
    marginBottom: 8,
    color: "#c2185b",
  },
  detalheTexto: {
    fontSize: 16,
    color: "#4a148c",
  },
});
