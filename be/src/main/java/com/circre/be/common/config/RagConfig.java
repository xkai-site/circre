package com.circre.be.common.config;

/**
 * {@code @BelongsProject:}be
 * {@code @BelongsPackage:}com.circre.be.common.config
 * {@code @Author:} Xukai
 * {@code @CreateTime:}2025-07-26  00:20
 * {@code @Description:}TODO
 * {@code @Version:}1.0
 */

import com.circre.be.common.constant.Knowledge;
import dev.langchain4j.data.document.Document;
import dev.langchain4j.data.document.loader.FileSystemDocumentLoader;
import dev.langchain4j.data.segment.TextSegment;
import dev.langchain4j.model.embedding.EmbeddingModel;
import dev.langchain4j.rag.content.retriever.ContentRetriever;
import dev.langchain4j.rag.content.retriever.EmbeddingStoreContentRetriever;
import dev.langchain4j.store.embedding.EmbeddingStore;
import dev.langchain4j.store.embedding.EmbeddingStoreIngestor;
import dev.langchain4j.store.embedding.inmemory.InMemoryEmbeddingStore;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.List;

@Configuration
public class RagConfig {

    @Resource
    private EmbeddingModel qwenEmbeddingModel;

    // 为每个知识库创建独立的EmbeddingStore
    @Bean(name = "materialsStore")
    public EmbeddingStore<TextSegment> materialsStore() {
        return new InMemoryEmbeddingStore<>();
    }

    @Bean(name = "suppliersStore")
    public EmbeddingStore<TextSegment> suppliersStore() {
        return new InMemoryEmbeddingStore<>();
    }

    @Bean(name = "activitiesStore")
    public EmbeddingStore<TextSegment> activitiesStore() {
        return new InMemoryEmbeddingStore<>();
    }

    // 为每个知识库创建检索器
    @Bean(name = "materialsRetriever")
    public ContentRetriever materialsRetriever(
            @Qualifier("materialsStore") EmbeddingStore<TextSegment> store) {
        return createRetriever(store, Knowledge.MATERIALS);
    }

    @Bean(name = "suppliersRetriever")
    public ContentRetriever suppliersRetriever(
            @Qualifier("suppliersStore") EmbeddingStore<TextSegment> store) {
        return createRetriever(store, Knowledge.MATERIAL_SUPPLIER);
    }

    @Bean(name = "activitiesRetriever")
    public ContentRetriever activitiesRetriever(
            @Qualifier("activitiesStore") EmbeddingStore<TextSegment> store) {
        return createRetriever(store, Knowledge.ACTIVITY);
    }

    private ContentRetriever createRetriever(EmbeddingStore<TextSegment> store, Knowledge knowledge) {
        List<Document> docs = FileSystemDocumentLoader.loadDocuments(knowledge.getPath());

        EmbeddingStoreIngestor.builder()
                .embeddingStore(store)
                .embeddingModel(qwenEmbeddingModel)
                .build()
                .ingest(docs);

        return EmbeddingStoreContentRetriever.builder()
                .embeddingStore(store)
                .embeddingModel(qwenEmbeddingModel)
                .maxResults(4)
                .build();
    }
}